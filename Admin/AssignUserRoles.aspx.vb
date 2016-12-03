Imports DevExpress.Web.ASPxGridView

Partial Class AssignUserRoles
    Inherits System.Web.UI.Page

    Protected UserRolesDS As New dsCommissioning.USER_ROLESDataTable

    Protected ProjectDS As dsCommissioning.PROJECTSDataTable
    Protected ProjectCurRow As dsCommissioning.PROJECTSRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'If Not Session.Item("CurUserName") Is Nothing Then
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("../UserLogon.aspx")
            'End If

            ProjectDS = cxClass.GetProjects(0, True, True, Session.Item("CurUserID"))
            ProjectSelectPulldown.DataSource = ProjectDS
            ProjectSelectPulldown.ValueField = "PROJECT_ID"
            ProjectSelectPulldown.TextField = "PROJECT_NAME"
            ProjectSelectPulldown.DataBind()
        End If


        G1.DataSource = UserRolesDS
        G1.KeyFieldName = "INDEX"
        G1.DataBind()



        'G1.Columns.ColumnByFieldName("USER_ID").Width = System.Web.UI.WebControls.Unit.Pixel(280)
        'G1.Columns.ColumnByFieldName("TRADE_ID").Width = System.Web.UI.WebControls.Unit.Pixel(280)

    End Sub





    'Protected Sub G1_ValidateColumnValue(ByVal source As Object, ByVal e As DevExpress.Web.ASPxGrid.ValidateColumnValueEventArgs) Handles G1.ValidateColumnValue
    '    If e.Column.DataControllerColumn.DataField = "USER_ID" Then
    '        If e.Value Is Nothing Then
    '            G1.StatusText = "Error: The 'User' column value must be specified."
    '            e.Cancel = True
    '        End If
    '    End If
    '    If e.Column.DataControllerColumn.DataField = "TRADE_ID" Then
    '        If e.Value Is Nothing Then
    '            G1.StatusText = "Error: The 'Trade' column value must be specified."
    '            e.Cancel = True
    '        End If
    '    End If
    'End Sub

    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub

    Protected Sub G1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles G1.DataBinding
        If Not ProjectSelectPulldown.Value Is Nothing Then
            cxClass.GetUser_Roles(ProjectSelectPulldown.Value, UserRolesDS)

            If UserRolesDS.Rows.Count = 0 Then
                Dim CurUserRolesRow As dsCommissioning.USER_ROLESRow
                'Dim CurUserTradesRow As dsCommissioning.user_t
                'Dim CurUserCompanyIDRow As dsCommissioning.COMPANIESRow
                CurUserRolesRow = UserRolesDS.NewUSER_ROLESRow
                CurUserRolesRow.PROJECT_ID = ProjectSelectPulldown.Value
                CurUserRolesRow.TRADE_ID = 14
                CurUserRolesRow.COMPANY_ID = 2
                UserRolesDS.AddUSER_ROLESRow(CurUserRolesRow)
                cxClass.UpdateUser_Roles(UserRolesDS)
            End If
        End If
    End Sub

    Protected Sub G1_RowDeleting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles G1.RowDeleting
        Dim updatedrow As dsCommissioning.USER_ROLESRow = UserRolesDS.FindByPROJECT_IDCOMPANY_IDTRADE_ID(ProjectSelectPulldown.Value, e.Values("COMPANY_ID"), e.Values("TRADE_ID"))
        If Not updatedrow Is Nothing Then
            updatedrow.Delete()
            cxClass.UpdateUser_Roles(UserRolesDS)
        End If

        e.Cancel = True
        G1.DataBind()

    End Sub

    Protected Sub G1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles G1.RowInserting
        UserRolesDS.Rows.Add(New Object() {ProjectSelectPulldown.Value, e.NewValues("COMPANY_ID"), e.NewValues("TRADE_ID")})
        cxClass.UpdateUser_Roles(UserRolesDS)

        e.Cancel = True
        G1.CancelEdit()
        G1.DataBind()
    End Sub

    Protected Sub G1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles G1.RowUpdating
        Dim updatedrow As dsCommissioning.USER_ROLESRow
        updatedrow = UserRolesDS.FindByPROJECT_IDCOMPANY_IDTRADE_ID(ProjectSelectPulldown.Value, e.OldValues("COMPANY_ID"), e.OldValues("TRADE_ID"))
        If Not updatedrow Is Nothing Then
            updatedrow("TRADE_ID") = e.NewValues("TRADE_ID")
            updatedrow("COMPANY_ID") = e.NewValues("COMPANY_ID")
        End If
        cxClass.UpdateUser_Roles(UserRolesDS)
        e.Cancel = True
        G1.CancelEdit()
        'G1.DataBind()
    End Sub
End Class
