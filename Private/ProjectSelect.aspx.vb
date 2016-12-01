
Partial Class ProjectSelect
    Inherits System.Web.UI.Page

    Friend ProjectsDS As dsCommissioning.PROJECTSDataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session.Contents.Remove("CurProjectID")
            Session.Contents.Remove("CurProjName")
            Session.Contents.Remove("GridControlState")
            Session.Contents.Remove("CurGridRowKeyValue")
            Session.Contents.Remove("CurGridStatusFilter")
            Session.Contents.Remove("CurGridTradeFilter")

            'If Not Session.Item("CurUserName") Is Nothing Then
            '    Dim lbl As Label = DirectCast(Master.FindControl("LBLCurUser"), Label)

            '    lbl.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("UserLogon.aspx")
            'End If

            ProjectsDS = cxClass.GetProjects(0, User.IsInRole("Admin"), False, Session.Item("CurUserID"))
            ProjectsPulldown.DataSource = ProjectsDS
            ProjectsPulldown.ValueField = "PROJECT_ID"
            ProjectsPulldown.TextField = "PROJECT_NAME"
            ProjectsPulldown.DataBind()
            'ProjectsPulldown.EditorProperties.SortByDisplayText = True

            If User.IsInRole("Admin") Then
                LBLAdmin.Visible = True
                BTNManageUsers.Enabled = True
                BTNManageCompanies.Enabled = True
                BTNManageProjects.Enabled = True
                BTNAssignUsers.Enabled = True
                BTNUsageLog.Enabled = True
                BTNManageUsers.Visible = True
                BTNManageCompanies.Visible = True
                BTNManageProjects.Visible = True
                BTNAssignUsers.Visible = True
                BTNUsageLog.Visible = True
            Else
                LBLAdmin.Visible = False
                BTNManageUsers.Enabled = False
                BTNManageCompanies.Enabled = False
                BTNManageProjects.Enabled = False
                BTNAssignUsers.Enabled = False
                BTNUsageLog.Enabled = False
                BTNManageUsers.Visible = False
                BTNManageCompanies.Visible = False
                BTNManageProjects.Visible = False
                BTNAssignUsers.Visible = False
                BTNUsageLog.Visible = False
            End If
        End If
        Me.Form.DefaultButton = "BTNProjectSelect"
    End Sub

    Protected Sub ProjectsPulldown_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectsPulldown.PreRender
        ProjectsPulldown.Value = "Select a Project..."
    End Sub


    Protected Sub BTNManageCompanies_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNManageCompanies.Click
        Response.Redirect("../Admin/AddCompany.aspx")
    End Sub

    Protected Sub BTNManageUsers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNManageUsers.Click
        Response.Redirect("../Admin/AddUser.aspx")
    End Sub

    Protected Sub BTNManageProjects_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNManageProjects.Click
        Response.Redirect("../Admin/AddProject.aspx")
    End Sub

    Protected Sub BTNAssignUsers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNAssignUsers.Click
        Response.Redirect("../Admin/AssignUserRoles.aspx")
    End Sub
    Protected Sub BTNUsageLog_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNUsageLog.Click
        Response.Redirect("../Admin/ViewUsageLog.aspx")
    End Sub


    Protected Sub BTNProjectSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNProjectSelect.Click
        If Not ProjectsPulldown.Value.ToString = "Select a Project..." Then
            Session.Add("CurProjectID", ProjectsPulldown.Value)
            Session.Add("CurProjectName", ProjectsPulldown.Text)

            '--------------Begin log Function----------------------
            Dim Usage_LogDS As New dsCommissioning.USAGE_LOGDataTable
            Dim LogCurRow As dsCommissioning.USAGE_LOGRow
            LogCurRow = Usage_LogDS.NewUSAGE_LOGRow

            LogCurRow.LOGIN_TIME = DateTime.Now
            If Not Session.Item("CurUserID") Is Nothing Then
                LogCurRow.USER_ID = Session.Item("CurUserID")
            Else
                'Response.Write("<script type='text/javascript'>alert('Problem Adding User to Log.')</script>")
            End If

            If Not Session.Item("CurProjectID") Is Nothing Then
                LogCurRow.PROJECT_ID = Session.Item("CurProjectID")
            Else
                'Response.Write("<script type='text/javascript'>alert('Problem Adding Project to Log.')</script>")
            End If

            Usage_LogDS.AddUSAGE_LOGRow(LogCurRow)
            cxClass.UpdateUsage_Log(Usage_LogDS)
            '-------------End Log Function-------------------------

            Response.Redirect("ProjectSummary.aspx")
        Else
            PopupControl1.Text = "Please Select a Project."
            PopupControl1.ShowOnPageLoad = True
        End If
    End Sub

    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub

    Protected Sub BTNRequestAccess_Click(sender As Object, e As EventArgs) Handles BTNRequestAccess.Click
        Response.Redirect("../Private/RequestAccess.aspx")
    End Sub
    Protected Sub BTNMergeCompany_Click(sender As Object, e As EventArgs) Handles BTNMergeCompany.Click
        Response.Redirect("../Admin/Merge_Companies.aspx")
    End Sub
End Class


