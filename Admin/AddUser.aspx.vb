
Imports System.Web.Script.Services

Partial Class AddUser
    Inherits System.Web.UI.Page

    Protected UsersDS As dsCommissioning.USERSDataTable
    Protected UserCurRow As dsCommissioning.USERSRow
    Protected CompanyDS As dsCommissioning.COMPANIESDataTable

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json, UseHttpGet:=True)> _
    Public Shared Function GetNewPassowrd() As String
        Dim newpass As String
        newpass = RandomPassword.Generate(8, 8)
        Return newpass
    End Function



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'PopupControl1.ShowOnPageLoad = False
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            '    If Not Session.Item("CurUserName") Is Nothing Then
            '        LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            '        InputPassword.TextMode = TextBoxMode.Password
            '        InputPassVerify.TextMode = TextBoxMode.Password
            '    Else
            '        Response.Redirect("../UserLogon.aspx")
            '    End If

            UserSelectPulldown.Value = -1
            CompanyDS = cxClass.GetCompanies(0, False)
            InputCompany.DataSource = CompanyDS
            InputCompany.ValueField = "COMPANY_ID"
            InputCompany.TextField = "COMPANY_NAME"
            InputCompany.DataBind()

            If UserSelectPulldown.Value = -1 Then
                InputFirstName.Text = Nothing
                InputLastName.Text = Nothing
                ' InputUserName.Value = Nothing
                InputEmail.Value = Nothing
                InputAdmin.Value = False
                InputCompany.Value = Nothing
                InputPhone.Value = Nothing
                InputUserActive.Value = True
                InputPassword.Text = Nothing
                InputPassVerify.Text = Nothing
                ' BTNCreatePassword.Enabled = True
            End If
        End If

        UsersDS = cxClass.GetUsers(False)
        UserSelectPulldown.Items.Clear()
        UserSelectPulldown.Items.Add("Add New User...", -1)
        For Each Me.UserCurRow In UsersDS
            UserSelectPulldown.Items.Add(UserCurRow.USER_NAME.ToString, UserCurRow.USER_ID)
        Next
    End Sub

    Private Function UpdateUsers2DS() As Boolean

        If Not InputFirstName.Text Is Nothing Then
            UserCurRow.USER_NAME = InputFirstName.Text + " " + InputLastName.Text
            UserCurRow.FirstName = InputFirstName.Text
            UserCurRow.LastName = InputLastName.Text

        Else
            PopupControl1.Text = "Name is required.  Please enter a Name."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If

        'Need to check if Email address is duplicate and disallow if it is.
        'Should be able to use findbykey field if change useremail to be the key.
        'Changing the key might mess up links to other tables. 

        'If Regex.IsMatch(InputEmail.Value, "^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$") Then
        'Is check for email standard formating required
        UserCurRow.USER_EMAIL = InputEmail.Value


        If Not InputAdmin.Value Is Nothing Then
            UserCurRow.ISADMIN = InputAdmin.Value
        Else
            UserCurRow.SetISADMINNull()
        End If

        If Not InputUserActive.Value Is Nothing Then
            UserCurRow.ISACTIVE = InputUserActive.Value
        Else
            PopupControl1.Text = "Please Select a Status for this user (Active/InActive)"
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If

        If Not InputCompany.Value Is Nothing Then
            UserCurRow.COMPANY_ID = InputCompany.Value
        Else
            PopupControl1.Text = "Company is required.  Please select a Company.  If the company is not listed please add it, using the add company page, before you continue."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If


        If Not InputPhone.Value Is Nothing And Not InputPhone.Value = String.Empty Then
            UserCurRow.USER_PHONE = InputPhone.Value
        Else
            UserCurRow.SetUSER_PHONENull()
        End If

        If InputPassword.Enabled = True Then
            Dim HashedPass As String
            HashedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(InputPassword.Text, "SHA1")
            Dim HashedPassVerify As String
            HashedPassVerify = FormsAuthentication.HashPasswordForStoringInConfigFile(InputPassVerify.Text, "SHA1")

            If HashedPass = HashedPassVerify Then
                If CheckStrongPassword(InputPassword.Text) Then
                    UserCurRow.USER_PASSWORD = HashedPass
                Else
                    PopupControl1.Text = "Password does not meet complexity requirements, Please enter a new password.  The password must be at least 6 characters long and contain 3 different types of Characters.  For example Uppercase Letter, Number, Lowercase letter."
                    PopupControl1.ShowOnPageLoad = True
                    Return False
                End If
            Else
                PopupControl1.Text = "Passwords do not match please verify that you have entered the same password and both fields."
                PopupControl1.ShowOnPageLoad = True
                Return False
            End If
        End If

        Return True
    End Function
    Private Function CheckStrongPassword(ByVal PassTxt As String) As Boolean
        Dim GroupCount As Integer = 0
        If PassTxt.Length >= 6 Then
            'If PassTxt.CompareTo("Name") Then
            '    'Full name, Two parts first name and last name
            '    'Email, two parts before @ and after
            '    'CompanyName, in parts based on Spaces
            '    'Company(Abbrevation)
            'End If
            If Regex.IsMatch(PassTxt, "[\!]+|[\@]+|[\#]+|[\$]+|[\%]+|[\^]+|[\&]+|[\*]+|[\(]+|[\)]+|[\']+|[\<]+|[\>]+|[\-]+") Then
                GroupCount = GroupCount + 1
            End If
            If Regex.IsMatch(PassTxt, "[A-Z]+") Then
                GroupCount = GroupCount + 1
            End If
            If Regex.IsMatch(PassTxt, "[a-z]+") Then
                GroupCount = GroupCount + 1
            End If
            If Regex.IsMatch(PassTxt, "[0-9]+") Then
                GroupCount = GroupCount + 1
            End If
        End If

        If GroupCount >= 3 Then
            Return True
        Else
            Return False
        End If
    End Function


    Protected Sub UserSelectPulldown_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles UserSelectPulldown.SelectedIndexChanged
        UserCurRow = UsersDS.FindByUSER_ID(UserSelectPulldown.Value)
        If UserSelectPulldown.Value > -1 And Not UserCurRow Is Nothing Then
            InputFirstName.Text = UserCurRow.FirstName
            InputLastName.Text = UserCurRow.LastName
            'InputUserName.Text = UserCurRow.USER_NAME.ToString
            InputEmail.Value = UserCurRow.USER_EMAIL.ToString
            InputCompany.Value = UserCurRow.COMPANY_ID
            If Not UserCurRow.IsISADMINNull Then
                InputAdmin.Value = UserCurRow.ISADMIN
            End If
            If Not UserCurRow.IsUSER_PHONENull Then
                InputPhone.Value = UserCurRow.USER_PHONE.ToString
            End If
            If Not UserCurRow.IsISACTIVENull Then
                InputUserActive.Value = UserCurRow.ISACTIVE
            End If
            InputPassword.Text = Nothing
            InputPassVerify.Text = Nothing

            InputPassword.Enabled = False
            InputPassVerify.Enabled = False
            InputPassword.BackColor = Drawing.Color.LightGray
            InputPassVerify.BackColor = Drawing.Color.LightGray
            ' BTNCreatePassword.Enabled = False

        ElseIf UserSelectPulldown.Value = -1 Then
            InputFirstName.Text = Nothing
            InputLastName.Text = Nothing

            'InputUserName.Text = Nothing
            InputEmail.Value = Nothing
            InputAdmin.Value = False
            InputCompany.Value = Nothing
            InputPhone.Value = Nothing
            InputUserActive.Value = True
            InputPassword.Text = Nothing
            InputPassVerify.Text = Nothing

            InputPassword.Enabled = True
            InputPassVerify.Enabled = True
            'BTNCreatePassword.Enabled = True
        End If
    End Sub


    Protected Sub BTNUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNUpdate.Click
        Dim msg As String

        Try
            If UserSelectPulldown.Value > -1 Then
                UserCurRow = UsersDS.FindByUSER_ID(UserSelectPulldown.Value)
                If UpdateUsers2DS() = True Then
                    cxClass.UpdateUsers(UsersDS)
                    PopupControl1.Text = "User Updated"
                    PopupControl1.ShowOnPageLoad = True
                    msg = "user updated successfully."
                Else
                    Exit Sub
                End If
            ElseIf UserSelectPulldown.Value = -1 Then
                'code to check if user exist before add to prevent duplicates
                UserCurRow = UsersDS.NewUSERSRow
                If UpdateUsers2DS() = True Then
                    UsersDS.AddUSERSRow(UserCurRow)
                    cxClass.UpdateUsers(UsersDS)
                    PopupControl1.Text = "User Added"
                    PopupControl1.ShowOnPageLoad = True

                    'reset fields to be ready for another new user.
                    InputFirstName.Text = Nothing
                    InputLastName.Text = Nothing
                    InputEmail.Value = Nothing
                    InputAdmin.Value = False
                    InputCompany.Value = Nothing
                    InputPhone.Value = Nothing
                    InputUserActive.Value = True
                    InputPassword.Text = Nothing
                    InputPassVerify.Text = Nothing

                    InputPassword.Enabled = True
                    InputPassVerify.Enabled = True
                    msg = "user created successfully."
                Else
                    Exit Sub
                End If
            End If

            '----- refresh Pulldown -------------
            UserSelectPulldown.Items.Clear()
            UserSelectPulldown.Items.Add("Add New User...", -1)
            'Dim UserCurRow As dsCommissioning.USERSRow
            For Each Me.UserCurRow In UsersDS
                UserSelectPulldown.Items.Add(UserCurRow.USER_NAME.ToString, UserCurRow.USER_ID)
            Next

            'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "scirpt", "showSuccessMsg('" + msg + "');", True)

        Catch ex As Exception
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "scirpt", "showSuccessMsg('" + ex.Message + "');", True)
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
    End Sub
    Protected Sub BTNNewPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNNewPassword.Click
        Try
            If Not UserSelectPulldown.Value = -1 Then
                UserCurRow = UsersDS.FindByUSER_ID(UserSelectPulldown.Value)
            Else
                PopupControl1.Text = "Please Select a User "
                PopupControl1.ShowOnPageLoad = True
                Exit Sub
            End If


            'Generate Random Password
            Dim newpass As String = ""
            newpass = RandomPassword.Generate(8, 8)

            'code to encrypt password and insert to db goes here
            Dim HashedPass As String = ""
            HashedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(newpass, "SHA1")
            UserCurRow.USER_PASSWORD = HashedPass
            cxClass.UpdateUsers(UsersDS)
            PopupControl1.Text = "A New password has been generated and emailed to the User."
            PopupControl1.ShowOnPageLoad = True

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
                .To = UserCurRow.USER_EMAIL.ToString
                .Bcc = UsersDS.FindByUSER_ID(Session.Item("CurUserID")).USER_EMAIL.ToString
                .Subject = "New cxPortal Password for " & UserCurRow.USER_NAME.ToString
                .Body = messagebody
            End With
            System.Web.Mail.SmtpMail.SmtpServer = "192.168.100.4"
            System.Web.Mail.SmtpMail.Send(insmail)
        Catch ex As Exception
            PopupControl1.Text = ex.Message
            PopupControl1.ShowOnPageLoad = True
        End Try
    End Sub

    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub


    'Protected Sub BTNCreatePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCreatePassword.Click
    '    Dim newpass As String = ""
    '    newpass = RandomPassword.Generate(8, 8)
    '    'InputPassword.Text = newpass
    '    InputPassword.Attributes.Add("value", newpass)
    '    'InputUserName.Value = "asdasd"
    '    'InputPassVerify.Text = newpass
    '    InputPassword.Attributes.Add("value", newpass)
    '    'Must Decide if it should email people or display in plain text etc.

    'End Sub


    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub
End Class
