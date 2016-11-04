
Partial Class Private_IssueRPT
    Inherits System.Web.UI.Page

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
                Dim IssueRPT As DevExpress.XtraReports.UI.XtraReport
                IssueRPT = New RPTProjectIssues
                ReportViewer1.Report = IssueRPT
                IssueRPT.DataSource = RPT_DeficiencyDS
                IssueRPT.Tag = Session.Item("CurProjectID")

                IssueRPT.FilterString = FilterString
                IssueRPT.CreateDocument()
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
