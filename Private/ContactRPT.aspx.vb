
Partial Class Private_ContactRPT
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
            Dim RPT_ContactDS As dsCommissioning.RPT_PROJ_CONTACTDataTable
            RPT_ContactDS = cxClass.GetRPTProjectContacts(Session.Item("CurProjectID"))

            'Remove Blank Row
            Dim temprow As dsCommissioning.RPT_PROJ_CONTACTRow
            temprow = RPT_ContactDS.FindByUSER_IDTRADE_ID(2, 14)
            temprow.Delete()

            If Not RPT_ContactDS Is Nothing Then
                Dim ContactRPT As DevExpress.XtraReports.UI.XtraReport
                ContactRPT = New RPTProjectContacts
                ReportViewer1.Report = ContactRPT
                ContactRPT.DataSource = RPT_ContactDS
                ContactRPT.Tag = Session.Item("CurProjectID")
                ContactRPT.CreateDocument()
            End If
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
    End Sub
End Class
