Imports System.Net
Imports System.Net.Mail
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports System.Data
Partial Class Default2
    Inherits System.Web.UI.Page


    Protected Sub BTNUpdate_Click(sender As Object, e As EventArgs) Handles BTNUpdate.Click
        Try
            Dim mm As New MailMessage("testeac7@gmail.com", "testeac7@gmail.com")
            mm.Subject = "Request Access"
            mm.Body = String.Format("A new request access has been generated for <b>" & ASPxTextBoxName.Text & "</b><br/><br/><table border=1><tr><td height=20px>" & "ID : </td><td height=20px>" & ASPxTextBoxEmail.Text & "</td>" & "</tr><tr><td height=20px>Company : </td><td height=20px>" & ASPxComboBoxCompany.Text & "</td></tr><tr><td height=20px>" & "Phone Number : </td><td height=20px>" & ASPxTextBoxPhoe.Text & "</td></tr><tr><td height=20px>" & "Email : </td><td height=20px>" & ASPxTextBoxEmail.Text & "</td></tr><tr><td height=20px>" & "Message : </td height=20px>" & InputComNoticeIntro.Text & "</td></tr></table>")
            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential()
            NetworkCred.UserName = "testeac7@gmail.com"
            NetworkCred.Password = "popup$$1234"
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 587
            smtp.Send(mm)
            'PopupControl1.Text = "Message sent."
            'PopupControl1.ShowOnPageLoad = False
            ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Mail Sent...');", True)
            clearControls()
        Catch ex As Exception
            'PopupControl1.Text = ex.Message
            'PopupControl1.ShowOnPageLoad = False
            ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Error Occured...');", True)
            clearControls()
        End Try

    End Sub
    Dim Conn As New SqlConnection()
    Dim cmd As SqlCommand
    Public Function getCompany() As Boolean
        If Not Page.IsPostBack Then
            Conn = cxClass.vCommConn
            cmd = New SqlCommand("Select * from COMPANIES where ISACTIVE=1", Conn)
            Conn.Open()
            Using sdr As SqlDataReader = cmd.ExecuteReader()
                While sdr.Read()
                    Dim item As New DevExpress.Web.ASPxEditors.ListEditItem
                    item.Text = sdr("COMPANY_NAME").ToString()
                    item.Value = sdr("COMPANY_ID").ToString()
                    ASPxComboBoxCompany.Items.Add(item)
                End While
            End Using
            ASPxComboBoxCompany.DataSource = cmd.ExecuteReader()
            ASPxComboBoxCompany.TextField = "COMPANY_NAME"
            ASPxComboBoxCompany.ValueField = "COMPANY_ID"
            ASPxComboBoxCompany.DataBind()
            Conn.Close()
        End If
        Return True
    End Function
    Public Function clearControls() As Boolean
        ASPxTextBoxName.Text = ""
        ASPxComboBoxCompany.SelectedIndex = 0
        ASPxTextBoxPhoe.Text = ""
        ASPxTextBoxEmail.Text = ""
        InputComNoticeIntro.Text = ""
        Return True
    End Function
    Protected Sub BTNCancel_Click(sender As Object, e As EventArgs) Handles BTNCancel.Click
        Response.Redirect("~/Private/ProjectSelect.aspx")
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        getCompany()
    End Sub
End Class
