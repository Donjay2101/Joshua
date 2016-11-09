
Partial Class ProjectSummary
    Inherits System.Web.UI.Page

    Protected ProjectsDS As dsCommissioning.PROJECTSDataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session.Contents.Remove("GridControlState")
            Session.Contents.Remove("CurGridRowKeyValue")
            Session.Contents.Remove("CurGridStatusFilter")
            Session.Contents.Remove("CurGridTradeFilter")

            'If Not Session.Item("CurUserName") Is Nothing Then
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("UserLogon.aspx")
            'End If

            If Session.Item("CurProjectID") = Nothing Then
                Response.Redirect("ProjectSelect.aspx")
            End If

            Try
                ProjectsDS = cxClass.GetProjects(Session.Item("CurProjectID"), False, False, Session.Item("CurUserID"))
                Dim CurProjectRow As dsCommissioning.PROJECTSRow
                CurProjectRow = ProjectsDS.Rows(0)

                LBLProjectNumber.Text = CurProjectRow.PROJECT_NUMBER.ToString
                LBLProjectName.Text = CurProjectRow.PROJECT_NAME.ToString
                If Not CurProjectRow.IsPROJECT_LOCNull Then
                    LBLProjectLoc.Text = CurProjectRow.PROJECT_LOC.ToString
                End If
                If Not CurProjectRow.IsPROJECT_DESCNull Then
                    LBLProjectDesc.Text = CurProjectRow.PROJECT_DESC.ToString
                End If
                If Not CurProjectRow.IsPROJECT_LEED_CANull Then
                    LBLLeadCA.Text = CurProjectRow.PROJECT_LEED_CA.ToString
                End If
                If Not CurProjectRow.IsPROJECT_OWNERNull Then
                    LBLOwner.Text = CurProjectRow.PROJECT_OWNER.ToString
                End If
                If Not CurProjectRow.IsPROJECT_LEED_EMAILNull Then
                    LBLLeadCAEmail.NavigateURL = "mailto:" & CurProjectRow.PROJECT_LEED_EMAIL.ToString
                    LBLLeadCAEmail.Text = "" & CurProjectRow.PROJECT_LEED_EMAIL.ToString
                End If
            Catch ex As Exception
                'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
            End Try
        End If


        Try
            LBLTotalDef.Text = "There are " & cxClass.GetTotalDef(Session.Item("CurProjectID")) & " total commissioning Items."
            LBLTotalOpen.Text = "There are " & cxClass.GetTotalDefOpen(Session.Item("CurProjectID")) & " open commissioning items"
            LBLDefNoResponse.Text = "There are " & cxClass.GetDefNoResponse(Session.Item("CurProjectID")) & " items not responded to that remain open."
            LBLResponseOpen.Text = "There are " & cxClass.GetDefReponseOpen(Session.Item("CurProjectID")) & " items responded to that remain open."
            LBLPendingVerify.Text = "There are " & cxClass.GetTotalDefPending(Session.Item("CurProjectID")) & " items Pending Verification"
            LBLResponseClose.Text = "There are " & cxClass.GetTotalDefClosed(Session.Item("CurProjectID")) & " closed items"
            If Not cxClass.GetLastestDateDef(Session.Item("CurProjectID")) = Nothing Then
                LBLDatePosted.Text = "New Issues have been posted on " & cxClass.GetLastestDateDef(Session.Item("CurProjectID")).ToShortDateString & "."
            Else
                LBLDatePosted.Text = "No New Issues have been posted."
            End If
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
        Me.Form.DefaultButton = "BTNShowIssues"
    End Sub

    Protected Sub BTNShowIssues_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNShowIssues.Click
        Response.Redirect("IssueLog.aspx")
    End Sub

    Protected Sub BTNResponseAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNResponseAdd.Click
        'If User.IsInRole("Admin") Then
        Response.Redirect("AddResponse.aspx")
        'End If
    End Sub

    Protected Sub BTNContacts_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNContacts.Click
        Response.Redirect("ContactRPT.aspx")
    End Sub
End Class
