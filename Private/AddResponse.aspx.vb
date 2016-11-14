
Partial Class AddResponse
    Inherits System.Web.UI.Page

    Protected DeficiencyDS As New dsCommissioning.DEFICIENCIESDataTable
    Protected CurIssuesRow As dsCommissioning.DEFICIENCIESRow
    Protected CompanyDS As dsCommissioning.COMPANIESDataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Not Session.Item("CurUserName") Is Nothing Then  'Check if someone is Logged on
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("../UserLogon.aspx")
            'End If
            If Session.Item("CurProjectID") Is Nothing Then ' Check to see if Project is Selected
                Response.Redirect("ProjectSelect.aspx")
            Else
                txtProjectName.Value = Session.Item("CurProjectName")
            End If

            If User.IsInRole("Admin") Then
                InputActionBy.Enabled = True
                InputStatus.Enabled = True
            Else
                InputActionBy.Enabled = False
                InputStatus.Enabled = False
            End If

            InputStatus.Items.Clear()
            InputStatus.Items.Add("Open", "Open")
            InputStatus.Items.Add("Closed", "Closed")
            InputStatus.Items.Add("Pending Verification", "Pending Verification")

        End If

        'should this be inside or outside of is postback
        CompanyDS = cxClass.GetCompanies(Session.Item("CurProjectID"), True)
        InputActionBy.DataSource = CompanyDS
        InputActionBy.ValueField = "COMPANY_ID"
        InputActionBy.TextField = "COMPANY_NAME"
        InputActionBy.DataBind()


        cxClass.GetDeficiencies(Session.Item("CurProjectID"), Nothing, "All", DeficiencyDS)

        If Not IsPostBack Then
            ItemNoLookup.Items.Clear()
            For Each Me.CurIssuesRow In DeficiencyDS
                ItemNoLookup.Items.Add(CurIssuesRow.ITEM_NUMBER.ToString, CurIssuesRow.ITEM_NUMBER)
            Next
            ItemNoLookup.Value = Nothing

            If Not Session.Item("CurGridRowKeyValue") Is Nothing Then
                CurIssuesRow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), Session.Item("CurGridRowKeyValue"))
            Else
                CurIssuesRow = Nothing
            End If

            If Not CurIssuesRow Is Nothing Then
                txtItemTag.Value = CurIssuesRow.TAG_ID.ToString
                'If Not CurIssuesRow.IsITEM_DESCNull Then
                txtItemDesc.Value = CurIssuesRow.ITEM_DESC.ToString
                'End If
                If Not CurIssuesRow.IsITEM_STATUSNull Then
                    InputStatus.Value = CurIssuesRow.ITEM_STATUS
                End If
                If Not CurIssuesRow.IsCOMPANY_IDNull Then
                    InputActionBy.Value = CurIssuesRow.COMPANY_ID
                End If
                ItemNoLookup.Value = CurIssuesRow.ITEM_NUMBER
                If Not CurIssuesRow.IsITEM_COMMENTNull Then
                    txtPreviousResponse.Value = CurIssuesRow.ITEM_COMMENT.ToString
                End If
                InputResponse.Value = Nothing
            Else
                InputResponse.Value = Nothing
                ItemNoLookup.Value = Nothing
                InputResponse.Value = Nothing
                txtItemTag.Value = Nothing
                txtPreviousResponse.Value = Nothing
            End If
        End If
    End Sub


    Protected Sub BTNAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNAdd.Click

        Dim UserRoleDS As New dsCommissioning.USER_ROLESDataTable
        cxClass.GetUser_Roles(Session.Item("CurProjectID"), UserRoleDS)
        Dim userrolerow As dsCommissioning.USER_ROLESRow
        Dim UserAssignedJob As Boolean = False

        For Each userrolerow In UserRoleDS
            If userrolerow.USER_ID = Session.Item("CurUserID") Then
                UserAssignedJob = True
            End If
        Next
        If UserAssignedJob = False Then
            PopupControl1.Text = "The Current User is not assigned to this job."
            PopupControl1.ShowOnPageLoad = True
            Exit Sub
        End If

        If Not ItemNoLookup.Value Is Nothing Then
            CurIssuesRow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), ItemNoLookup.Value)
        Else
            PopupControl1.Text = "Please Choose an item to add a response to."
            PopupControl1.ShowOnPageLoad = True
            Exit Sub
        End If

        If Not CurIssuesRow Is Nothing Then
            If CurIssuesRow.ITEM_STATUS = "Closed" And Not User.IsInRole("Admin") Then
                PopupControl1.Text = "This item is Closed and no new responses may be added."
                PopupControl1.ShowOnPageLoad = True
                Exit Sub
            End If

            'compare deficiencyDS.currow.company ID to users company ID to see if he is assigned to item
            'Allow or disallow response adding based on company
            If Not CurIssuesRow.IsCOMPANY_IDNull Then
                If Not CurIssuesRow.COMPANY_ID = Session.Item("CurUserCompanyID") And Not User.IsInRole("Admin") Then
                    '----add code to check Company Heirchay----
                    Dim Company_HeirachyDS As New dsCommissioning.COMPANY_HEIRACHYDataTable
                    cxClass.GetCompany_Heirachy(Session.Item("CurProjectID"), Company_HeirachyDS)
                    Dim Company_HeirachyCurRow As dsCommissioning.COMPANY_HEIRACHYRow
                    Dim IsParentCompany As Boolean = False

                    For Each Company_HeirachyCurRow In Company_HeirachyDS
                        If CurIssuesRow.COMPANY_ID = Company_HeirachyCurRow.SUB_COMPANY_ID Then
                            If Company_HeirachyCurRow.PARENT_COMPANY_ID = Session.Item("CurUserCompanyID") Then
                                IsParentCompany = True
                                Exit For
                            End If
                        End If
                    Next
                    '------------------------------------------
                    If IsParentCompany = False Then
                        PopupControl1.Text = "Your Company is not responsible for this item.  You may only respond to items that are assigned to you."
                        PopupControl1.ShowOnPageLoad = True
                        Exit Sub
                    End If
                End If
            ElseIf Not User.IsInRole("Admin") Then
                PopupControl1.Text = "Your Company is not responsible for this item.  You may only respond to items that are assigned to you."
                PopupControl1.ShowOnPageLoad = True
                Exit Sub
            End If

            If User.IsInRole("Admin") Then
                If Not InputStatus.Value Is Nothing Then
                    CurIssuesRow.ITEM_STATUS = InputStatus.Value
                Else
                    CurIssuesRow.SetITEM_STATUSNull()
                End If
                If Not InputActionBy.Value Is Nothing Then
                    CurIssuesRow.COMPANY_ID = InputActionBy.Value
                Else
                    CurIssuesRow.SetCOMPANY_IDNull()
                End If
            End If

            Dim ResponseText As String
            ResponseText = InputResponse.Value
            While ResponseText.EndsWith(vbLf)
                ResponseText = ResponseText.TrimEnd(vbLf)
                ResponseText = ResponseText.TrimEnd(vbCr)
            End While

            If Not ResponseText Is Nothing And ResponseText <> "" And Not ResponseText = String.Empty Then
                'CompanyDS = cxClass.GetCompanies(Session.Item("CurProjectID"), True)
                If Not CompanyDS Is Nothing Then
                    If Not CompanyDS.FindByCOMPANY_ID(Session.Item("CurUserCompanyID")) Is Nothing Then
                        Dim CurCompanyRow As dsCommissioning.COMPANIESRow
                        CurCompanyRow = CompanyDS.FindByCOMPANY_ID(Session.Item("CurUserCompanyID"))

                        Dim CurText As String
                        If Not CurIssuesRow.IsITEM_COMMENTNull Then
                            CurText = CurIssuesRow.ITEM_COMMENT.ToString
                        Else
                            CurText = ""
                        End If
                        CurIssuesRow.ITEM_COMMENT = Format(Date.Today, "yyyy/MM/dd") & " " & CurCompanyRow.COMPANY_ABB.ToString & " - " & ResponseText & vbCrLf & vbCrLf & CurText
                    End If

                Else
                    PopupControl1.Text = "Current User is not Assigned to a Company."
                    PopupControl1.ShowOnPageLoad = True
                    Exit Sub
                End If
            ElseIf Not User.IsInRole("Admin") Then
                PopupControl1.Text = "Please enter a response in the New Response Box."
                PopupControl1.ShowOnPageLoad = True
                Exit Sub
            End If

        Else
            PopupControl1.Text = "Please Choose an Item to add a response to."
            PopupControl1.ShowOnPageLoad = True
            Exit Sub
        End If

        cxClass.UpdateDeficiencies(DeficiencyDS)

        If Not CurIssuesRow.IsITEM_COMMENTNull Then
            txtPreviousResponse.Value = CurIssuesRow.ITEM_COMMENT.ToString
        End If

        InputResponse.Text = Nothing
    End Sub

    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("IssueLog.aspx")
    End Sub



    Protected Sub ItemNoLookup_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ItemNoLookup.SelectedIndexChanged
        If Not ItemNoLookup.Value Is Nothing Then
            CurIssuesRow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), ItemNoLookup.Value)
            If Not CurIssuesRow Is Nothing Then
                '---Check if User is responsible for item or is admin--------
                If Not User.IsInRole("Admin") And Not CurIssuesRow.COMPANY_ID = Session.Item("CurUserCompanyID") Then
                    '----add code to check Company Heirchay----
                    Dim Company_HeirachyDS As New dsCommissioning.COMPANY_HEIRACHYDataTable
                    cxClass.GetCompany_Heirachy(Session.Item("CurProjectID"), Company_HeirachyDS)
                    Dim Company_HeirachyCurRow As dsCommissioning.COMPANY_HEIRACHYRow
                    Dim IsParentCompany As Boolean = False

                    For Each Company_HeirachyCurRow In Company_HeirachyDS
                        If CurIssuesRow.COMPANY_ID = Company_HeirachyCurRow.SUB_COMPANY_ID Then
                            If Company_HeirachyCurRow.PARENT_COMPANY_ID = Session.Item("CurUserCompanyID") Then
                                IsParentCompany = True
                                Exit For
                            End If
                        End If
                    Next
                    '------------------------------------------
                    If IsParentCompany = False Then
                        PopupControl1.Text = "Your Company is not responsible for this item.  You may only respond to items that are assigned to you."
                        PopupControl1.ShowOnPageLoad = True
                        Exit Sub
                    End If
                End If
                '----------------------------------------------------

                txtItemTag.Value = CurIssuesRow.TAG_ID.ToString
                'If Not CurIssuesRow.IsITEM_DESCNull Then
                txtItemDesc.Value = CurIssuesRow.ITEM_DESC.ToString
                'End If
                If Not CurIssuesRow.IsITEM_STATUSNull Then
                    InputStatus.Value = CurIssuesRow.ITEM_STATUS
                End If
                If Not CurIssuesRow.IsCOMPANY_IDNull Then
                    InputActionBy.Value = CurIssuesRow.COMPANY_ID
                End If

                If Not CurIssuesRow.IsITEM_COMMENTNull Then
                    txtPreviousResponse.Value = CurIssuesRow.ITEM_COMMENT.ToString
                Else
                    txtPreviousResponse.Value = Nothing
                End If

                ItemNoLookup.Value = CurIssuesRow.ITEM_NUMBER
                InputResponse.Text = Nothing
            Else
                InputResponse.Text = Nothing
                ItemNoLookup.Value = Nothing
                InputResponse.Value = Nothing
                txtItemTag.Value = Nothing
                txtPreviousResponse.Value = Nothing
            End If
        End If
    End Sub

    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub
End Class
