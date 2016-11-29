
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub BTNUpdate_Click(sender As Object, e As EventArgs) Handles BTNUpdate.Click

    End Sub
    Protected Sub BTNCancel_Click(sender As Object, e As EventArgs) Handles BTNCancel.Click
        Response.Redirect("~/Private/ProjectSelect.aspx")
    End Sub
End Class
