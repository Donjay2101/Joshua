Imports Microsoft.Reporting.WebForms
Imports System.Data.SqlClient
Imports System.Data
Partial Class Private_IssueRPT
    Inherits System.Web.UI.Page
    Protected ProjectsDS As dsCommissioning.PROJECTSDataTable
    Protected CompanyDS As dsCommissioning.COMPANIESDataTable
    'Private Function GetData(query As String) As dsIssue
    '    Dim conString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Dim cmd As New SqlCommand(query)
    '    Using con As New SqlConnection(conString)
    '        Using sda As New SqlDataAdapter()
    '            cmd.Connection = con

    '            sda.SelectCommand = cmd
    '            Using dsCustomers As New dsIssue()
    '                sda.Fill(dsCustomers, "DataTable1")
    '                Return dsCustomers
    '            End Using
    '        End Using
    '    End Using
    'End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'Check if user is logged in and display name, send back to login if no current user
            If Session.Item("CurUserName") Is Nothing Then
                Response.Redirect("../UserLogon.aspx")
            End If

            'Send Back to Project Select if no current project
            If Session.Item("CurProjectID") = Nothing Then
                Response.Redirect("ProjectSelect.aspx")
            End If
            'CODE CHANGED BY JOHN

        End If
        Try
            'Get which company is filtered if Any and apply company filter directly to datasource. 
            Dim COMPANYID As String
            If Session.Item("FilterString") Like "*COMPANY_ID*" Then
                COMPANYID = Session.Item("FilterString")
                COMPANYID = COMPANYID.Remove(0, COMPANYID.IndexOf("COMPANY_ID"))
                COMPANYID = COMPANYID.Remove(0, 14)
                If COMPANYID.IndexOf("And") > 0 Then
                    COMPANYID = COMPANYID.Remove(COMPANYID.IndexOf("And"), (COMPANYID.Length - COMPANYID.IndexOf("And")))
                End If
            Else
                COMPANYID = Nothing
            End If

            'Generate Datasource based on company filter
            If Session.Item("GridSort") = "COMPANY_ID" Then
                Session.Item("GridSort") = "COMPANY_ABB"
            End If
            Dim RPT_DeficiencyDS As dsCommissioning.RPT_DEFICIENCIESDataTable
            RPT_DeficiencyDS = cxClass.GetRPTDeficiencies(Session.Item("CurProjectID"), COMPANYID, "All", Session.Item("GridSort"))

            Dim qryString As String
            qryString = cxClass.GetRPTDeficienciesQuery(Session.Item("CurProjectID"), COMPANYID, "All", Session.Item("GridSort"))

            'ReportViewer1.ProcessingMode = ProcessingMode.Local
            'ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Private/Report2.rdlc")
            'Dim dsCustomers As dsIssue = GetData(qryString)
            'Dim datasource As New ReportDataSource("DataTable1", dsCustomers.Tables(0))
            'ReportViewer1.LocalReport.DataSources.Clear()
            'ReportViewer1.LocalReport.DataSources.Add(datasource)
            If (Not IsPostBack) AndAlso (Not IsCallback) Then
                ReportViewer1.ProcessingMode = ProcessingMode.Local
                'set path of the Local report  
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Private/Report2.rdlc")
                'creating object of DataSet dsEmployee and filling the DataSet using SQLDataAdapter  
                Dim dsemp As New dsIssue()
                Dim conString As String = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString

                Dim con As New SqlConnection(conString)
                Dim cmd As New SqlCommand(qryString)
                cmd.Connection = con
                cmd.CommandType = CommandType.Text
                cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))

                con.Open()
                Dim adapt As New SqlDataAdapter(cmd)
                adapt.Fill(dsemp, "DataTable1")
                con.Close()
                'Providing DataSource for the Report  
                Dim rds As New ReportDataSource("dsIssue", dsemp.Tables(0))
                ReportViewer1.LocalReport.DataSources.Clear()
                'Add ReportDataSource  
                Dim rpt1 As ReportParameter
                rpt1 = New ReportParameter("param1", Session("Prj_Name").ToString())
                Dim rpt2 As ReportParameter
                rpt2 = New ReportParameter("param2", Session("Prj_No").ToString())
                Dim rpt3 As ReportParameter
                rpt3 = New ReportParameter("param3", Session("Prj_Lead").ToString())
                Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt1})
                Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt2})
                Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt3})
                Dim CompanyKey As String = ""

                Try
                    ProjectsDS = cxClass.GetProjects(Session.Item("CurProjectID"), True, False, 0)
                    Dim CurProjectRow As dsCommissioning.PROJECTSRow
                    CurProjectRow = ProjectsDS.Rows(0)
                    'ProjName.Text = CurProjectRow.PROJECT_NAME.ToString
                    'ProjNameFTR.Text = CurProjectRow.PROJECT_NAME.ToString
                    'ProjNum.Text = CurProjectRow.PROJECT_NUMBER.ToString
                    If Not CurProjectRow.IsPROJECT_LEED_CANull Then
                        'LeadCA.Text = CurProjectRow.PROJECT_LEED_CA.ToString
                    End If
                    If Not CurProjectRow.IsPROJECT_COMNOTICE_INFONull Then
                        'ComNoticeInfoTXT.Text = CurProjectRow.PROJECT_COMNOTICE_INFO.ToString
                    End If
                    'CurDate.Text = Date.Today.ToLongDateString

                    CompanyDS = cxClass.GetCompanies(Session.Item("CurProjectID"), False)

                    Dim CompanyCurRow As dsCommissioning.COMPANIESRow
                    For Each CompanyCurRow In CompanyDS
                        CompanyKey &= CompanyCurRow.COMPANY_ABB.ToString & " - " & CompanyCurRow.COMPANY_NAME.ToString & ",  "
                    Next
                    'Key.Text = CompanyKey
                    Dim rpt4 As ReportParameter
                    rpt4 = New ReportParameter("param4", CompanyKey)
                    Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt4})
                Catch ex As Exception
                    'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
                End Try

                ReportViewer1.LocalReport.DataSources.Add(rds)
            End If


            'Dim dsTable As dsIssue
            'dsTable = Nothing
            'dsTable.Tables.AddRange(New DataTable() {RPT_DeficiencyDS})

            'For Each dr As DataRow In RPT_DeficiencyDS.Rows
            '    dsTable.DataTable1.Rows.Add(dr.ItemArray)
            'Next



            'remove company ID from filter string so others can be applied to report
            'Removes company ID string from filter string if company id is the first or last items in the filter string
            'Also can remove company ID from filter string if company is between 2 other filters
            'may remove other filters if company ID is not first or last item and 4 or more filter conditions exist
            Dim FilterString As String
            FilterString = Session.Item("FilterString")

            If FilterString.Contains("COMPANY_ID") And Not FilterString.Contains("And") Then
                FilterString = Nothing
            ElseIf FilterString.Contains("COMPANY_ID") Then
                If Not FilterString.LastIndexOf("And") > FilterString.IndexOf("COMPANY_ID") Then
                    'company ID is at end of filter string
                    FilterString = FilterString.Remove((FilterString.IndexOf("COMPANY_ID") - 5), (FilterString.Length - FilterString.IndexOf("COMPANY_ID") + 5))
                Else
                    If FilterString.IndexOf("And") < FilterString.IndexOf("COMPANY_ID") Then
                        'company id is between two other filters with Ands
                        FilterString = FilterString.Remove((FilterString.IndexOf("COMPANY_ID") - 1), (FilterString.LastIndexOf("And") - (FilterString.IndexOf("COMPANY_ID") - 5)))
                    Else
                        'Company ID is at begining 
                        FilterString = FilterString.Remove((FilterString.IndexOf("COMPANY_ID") - 1), (FilterString.IndexOf("And") + 3))
                    End If
                End If
            End If

            'create Report
            If Not RPT_DeficiencyDS Is Nothing Then
                'Dim IssueRPT As DevExpress.XtraReports.UI.XtraReport
                'IssueRPT = New RPTProjectIssues
                'ReportViewer1.Report = IssueRPT
                'IssueRPT.DataSource = RPT_DeficiencyDS
                'IssueRPT.Tag = Session.Item("CurProjectID")

                'IssueRPT.FilterString = FilterString
                'IssueRPT.CreateDocument()
            End If
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
End Class
