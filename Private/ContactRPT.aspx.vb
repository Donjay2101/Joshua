Imports Microsoft.Reporting.WebForms
Imports System.Data
Imports System.Data.SqlClient
Partial Class Private_ContactRPT
    Inherits System.Web.UI.Page

    'Private Function GetData() As Contact
    '    Dim conString As String = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString
    '    Dim cmd As New SqlCommand("Get_Contact")
    '    Using con As New SqlConnection(conString)
    '        Using sda As New SqlDataAdapter()
    '            cmd.Connection = con
    '            cmd.CommandType = CommandType.StoredProcedure
    '            cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
    '            sda.SelectCommand = cmd
    '            Using dsContact As New Contact()
    '                sda.Fill(dsContact, "DataTable1")
    '                Return dsContact
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
            'Code changed by John
            'set Processing Mode of Report as Local  
            ReportViewer1.ProcessingMode = ProcessingMode.Local
            'set path of the Local report  
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Private/Report.rdlc")
            'creating object of DataSet dsEmployee and filling the DataSet using SQLDataAdapter  
            Dim dsemp As New dsContact()
            Dim conString As String = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString

            Dim con As New SqlConnection(conString)
            Dim cmd As New SqlCommand("Get_Contact")
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
            con.Open()
            Dim adapt As New SqlDataAdapter(cmd)
            adapt.Fill(dsemp, "DataTable1")
            con.Close()
            'Providing DataSource for the Report  
            Dim rds As New ReportDataSource("dsContact", dsemp.Tables(0))
            ReportViewer1.LocalReport.DataSources.Clear()
            'Add ReportDataSource  
            Dim rpt1 As ReportParameter
            rpt1 = New ReportParameter("param1", Session("Prj_Name").ToString())
            Dim rpt2 As ReportParameter
            rpt2 = New ReportParameter("param2", Session("Prj_No").ToString())
            Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt1})
            Me.ReportViewer1.LocalReport.SetParameters(New ReportParameter() {rpt2})
            ReportViewer1.LocalReport.DataSources.Add(rds)


        End If

        Try
            'Dim RPT_ContactDS As dsCommissioning.RPT_PROJ_CONTACTDataTable
            'RPT_ContactDS = cxClass.GetRPTProjectContacts(Session.Item("CurProjectID"))

            ''Remove Blank Row
            'Dim temprow As dsCommissioning.RPT_PROJ_CONTACTRow
            'temprow = RPT_ContactDS.FindByUSER_IDTRADE_ID(2, 14)
            ''temprow.Delete()

            'If Not RPT_ContactDS Is Nothing Then
            '    Dim ContactRPT As DevExpress.XtraReports.UI.XtraReport
            '    ContactRPT = New RPTProjectContacts
            '    ReportViewer1.Report = ContactRPT
            '    ContactRPT.DataSource = RPT_ContactDS
            '    ContactRPT.Tag = Session.Item("CurProjectID")
            '    ContactRPT.CreateDocument()



            'End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
    End Sub

End Class
