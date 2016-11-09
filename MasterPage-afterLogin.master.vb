
Partial Class MasterPage_afterLogin
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session.Item("CurUserName") Is Nothing Then
            LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
        Else
            Response.Redirect("../UserLogon.aspx")
        End If
    End Sub
End Class

