Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Sql
Partial Class Merge_Companies
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        GetCompanies()
    End Sub
    Dim Conn As New SqlConnection()
    Dim cmd As SqlCommand
    Public Function GetCompanies() As Boolean
        If Not Page.IsPostBack Then
            Conn = cxClass.vCommConn
            cmd = New SqlCommand("Select * from COMPANIES where ISACTIVE=1", Conn)
            Conn.Open()
            Using sdr As SqlDataReader = cmd.ExecuteReader()
                While sdr.Read()
                    Dim item As New ListItem()
                    item.Text = sdr("COMPANY_NAME").ToString()
                    item.Value = sdr("COMPANY_ID").ToString()
                    listCompany.Items.Add(item)
                End While
            End Using
            oneCompany.DataSource = cmd.ExecuteReader()
            oneCompany.DataTextField = "COMPANY_NAME"
            oneCompany.DataValueField = "COMPANY_ID"
            oneCompany.DataBind()
            Conn.Close()
        End If
        Return True
    End Function
    Public Function GetValues() As String
        Dim sCheckedValue As String = ""
        For Each oItem As ListItem In listCompany.Items
            If oItem.Selected Then
                sCheckedValue += String.Concat(oItem.Value, ",")
            Else
            End If
        Next
        sCheckedValue = String.Concat(sCheckedValue, "1236548")
        Return sCheckedValue
    End Function
    Protected Sub BTNUpdate_Click(sender As Object, e As EventArgs) Handles BTNUpdate.Click
        Conn = cxClass.vCommConn
        Dim par As String
        Dim par1 As String
        par = GetValues()
        par1 = par.Replace(oneCompany.SelectedValue, "6544398")
        Using cmd As New SqlCommand()
            cmd.CommandText = "update USERS set COMPANY_ID = " &
                                  "@COMPANY_ID where COMPANY_ID IN (" + par + ")"
            cmd.Parameters.AddWithValue("@COMPANY_ID", oneCompany.SelectedValue)
            cmd.Connection = Conn
            Conn.Open()
            Dim i As Integer = 0
            i = cmd.ExecuteNonQuery()
            ' If (i > 0) Then
            cmd.CommandText = "update DEFICIENCIES set COMPANY_ID=" + oneCompany.SelectedValue + " where COMPANY_ID IN (" + par + ")"
                cmd.ExecuteNonQuery()

                cmd.CommandText = "delete from COMPANIES where COMPANY_ID In(" + par1 + ")"
                cmd.ExecuteNonQuery()
            ' ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Success...');", True)
            'PopupControl1.Text = "Success."
            'PopupControl1.ShowOnPageLoad = False
            'Else
            'ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Failure...');", True)
            'PopupControl1.Text = "Failure."
            'PopupControl1.ShowOnPageLoad = False
            'End If
            Conn.Close()

        End Using
        For Each item As ListItem In listCompany.Items
            item.Selected = False
        Next
        ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('Success...');", True)
        Response.Redirect("~/Admin/Merge_Companies.aspx")
    End Sub
    Dim val As Integer
    Protected Sub oneCompany_SelectedIndexChanged(sender As Object, e As EventArgs) Handles oneCompany.SelectedIndexChanged

    End Sub
    Protected Sub BTNCancel_Click(sender As Object, e As EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub
End Class
