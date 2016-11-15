Imports System.Data.SqlClient


Partial Class cxLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'ErrorLabel.Visible = False
        Me.Form.DefaultButton = "BTNLogin"
        Me.Form.DefaultFocus = "InputUsername"

        If Not IsPostBack Then
            Session.RemoveAll()
            Session.Abandon()
            FormsAuthentication.SignOut()
        End If
    End Sub

    Protected Sub BTNLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNLogin.Click
        If ValidateUser(InputUsername.Text, InputPassword.Text) Then
            FormsAuthentication.RedirectFromLoginPage(InputUsername.Text, False)
        Else
            PopupControl1.ShowOnPageLoad = True
            'ErrorLabel.Visible = True
            'Response.Redirect("UserLogon.aspx", True)
        End If
    End Sub

    Function ValidateUser(ByVal uid As String, ByVal passwd As String) As Boolean
        Dim cnn As SqlConnection
        Dim cmd As SqlCommand
        Dim dr As SqlDataReader
        Dim retVal As Boolean = False
        cnn = New SqlConnection("Data Source=.;Initial Catalog=cxExample;Integrated Security=false;user id=sa;password=hello;")

        'Dim vSQL As String
        'vSQL &= "SELECT USER_ID, USER_NAME, COMPANY_ID, ISADMIN, ISACTIVE "
        'vSQL &= "SELECT * FROM USERS WHERE USER_EMAIL = @USER_EMAIL AND  ISACTIVE = 1"

        cmd = New SqlCommand("SELECT * FROM USERS WHERE USER_EMAIL = '" & uid & "' AND ISACTIVE = 1", cnn)
        cnn.Open()
        dr = cmd.ExecuteReader()
        While (dr.Read())
            If StrComp(dr.Item("USER_PASSWORD"), FormsAuthentication.HashPasswordForStoringInConfigFile(passwd, "SHA1"), 1) = 0 Then
                retVal = True
                Session.Add("CurUserName", dr.Item("USER_NAME"))
                Session.Add("CurUserID", dr.Item("USER_ID"))
                Session.Add("CurUserCompanyID", dr.Item("COMPANY_ID"))
            End If
        End While
        cnn.Close()
        ValidateUser = retVal
    End Function


    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub
End Class
