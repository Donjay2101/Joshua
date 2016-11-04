
Partial Class Public_Help
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Session.Item("CurUserName") Is Nothing Then
                LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            Else
                LBLCurUser.Text = "User not logged in"
            End If
        End If
    End Sub
End Class
