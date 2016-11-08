
Partial Class Private_ChangePassword
    Inherits System.Web.UI.Page

    Protected UsersDS As dsCommissioning.USERSDataTable
    Protected UserCurRow As dsCommissioning.USERSRow

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        Dim UserID As Integer
        Dim HashedPassword As String


        'loggedInuser = User.Identity.Name
        If (Session("CurUserID") Is Nothing) Then
            Response.Redirect("cxLogin.aspx")
        End If
        UserID = Session("CurUserID")
        UsersDS = cxClass.GetUsers(True)
        UserCurRow = UsersDS.FindByUSER_ID(UserID)
        HashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtCurrentPassword.Text, "SHA1")


        If StrComp(UserCurRow.USER_PASSWORD, HashedPassword, 1) = 0 Then
            HashedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtNewPassword.Text, "SHA1")
            UserCurRow.USER_PASSWORD = HashedPassword
            cxClass.UpdateUsers(UsersDS)

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "scirpt", "alert('password changed successfully.')", True)
        End If

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "scirpt", "alert('current password does not match.')", True)

    End Sub
End Class
