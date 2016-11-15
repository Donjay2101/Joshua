Imports System.Data.SqlClient
Imports System.Web.Script.Services

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

    <System.Web.Services.WebMethod()>
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)>
    Public Shared Function SendEmail() As String
        Dim email As String
        Dim UserCurRow As dsCommissioning.USERSRow
        Try
            email = ""
            If HttpContext.Current.Request.QueryString("Email") <> Nothing Then
                email = HttpContext.Current.Request.QueryString("Email").ToString()
            End If



            UserCurRow = cxClass.User_GetByUserName(email)
            'Generate Random Password
            Dim newpass As String = ""
            newpass = RandomPassword.Generate(8, 8)

            'code to encrypt password and insert to db goes here
            Dim HashedPass As String = ""
            HashedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(newpass, "SHA1")

            cxClass.User_UpdatePassword(email, HashedPass)

            'Create email and send
            Dim insmail As New System.Web.Mail.MailMessage

            Dim messagebody As String
            messagebody = ""
            messagebody &= "A new random password has been generated for " & UserCurRow.USER_NAME.ToString & ".  "
            messagebody &= "Please remember to record this password for your records, it will be required for you to access the BVH Commissioning portal." & vbCrLf
            messagebody &= vbCrLf
            messagebody &= "To logon to the cxPortal please go to http://cx.bvhis.com and logon using the information listed below." & vbCrLf
            messagebody &= vbCrLf
            messagebody &= "Username: " & UserCurRow.USER_EMAIL.ToString & vbCrLf
            messagebody &= "Password: " & newpass & vbCrLf

            With insmail
                .From = "Administrator@BVHis.com"
                'Could make email be addressed to currently logged on user which
                'this should always be the CA agent who clicked the button 
                'since only admins have access to page with button

                'Should User be sent his password and cx department bcc'ed or just to cx department
                .To = email
                .Subject = "New cxPortal Password for " & email
                .Body = messagebody
            End With
            System.Web.Mail.SmtpMail.SmtpServer = "192.168.100.4"
            System.Web.Mail.SmtpMail.Send(insmail)
        Catch ex As Exception

        End Try
    End Function


    Function ValidateUser(ByVal uid As String, ByVal passwd As String) As Boolean
        Dim cnn As SqlConnection
        Dim cmd As SqlCommand
        Dim dr As SqlDataReader
        Dim retVal As Boolean = False
        cnn = New SqlConnection("Data Source=.;Initial Catalog=cxExample;Integrated Security=true;")

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
