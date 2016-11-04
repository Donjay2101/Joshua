
Partial Class AddCompany
    Inherits System.Web.UI.Page

    Friend CompanyCurRow As dsCommissioning.COMPANIESRow
    Friend CompanyDS As dsCommissioning.COMPANIESDataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            If Not Session.Item("CurUserName") Is Nothing Then
                LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            Else
                Response.Redirect("../UserLogon.aspx")
            End If


        End If

        CompanyDS = cxClass.GetCompanies(0, False)
        CompanySelectPulldown.Items.Clear()
        CompanySelectPulldown.Items.Add("Add New Company...", -1)
        For Each Me.CompanyCurRow In CompanyDS
            CompanySelectPulldown.Items.Add(CompanyCurRow.COMPANY_NAME.ToString, CompanyCurRow.COMPANY_ID)
        Next

        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            CompanySelectPulldown.Value = -1
            If CompanySelectPulldown.Value = -1 Then
                InputCompanyName.Value = Nothing
                InputCompanyABB.Value = Nothing
                InputCompanyActive.Value = True
            End If
        End If

    End Sub

    Private Function UpdateCompany2DS() As Boolean
        If Not InputCompanyName.Value Is Nothing Then
            CompanyCurRow.COMPANY_NAME = InputCompanyName.Value
        Else
            PopupControl1.Text = "Company Name is required.  Please enter a name for this Company."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If
        If Not InputCompanyABB.Value Is Nothing Then
            CompanyCurRow.COMPANY_ABB = InputCompanyABB.Value
        Else
            PopupControl1.Text = "Company Abbreviation is required.  Please enter an Abbreviation."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If
        If Not InputCompanyActive.Value Is Nothing Then
            CompanyCurRow.ISACTIVE = InputCompanyActive.Value
        Else
            CompanyCurRow.SetISACTIVENull()
        End If
        Return True
    End Function


    Protected Sub CompanySelectPulldown_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles CompanySelectPulldown.SelectedIndexChanged
        CompanyCurRow = CompanyDS.FindByCOMPANY_ID(CompanySelectPulldown.Value)
        If CompanySelectPulldown.Value > -1 And Not CompanyCurRow Is Nothing Then
            InputCompanyName.Value = CompanyCurRow.COMPANY_NAME.ToString
            InputCompanyABB.Value = CompanyCurRow.COMPANY_ABB.ToString
            If Not CompanyCurRow.IsISACTIVENull Then
                InputCompanyActive.Value = CompanyCurRow.ISACTIVE
            End If
        ElseIf CompanySelectPulldown.Value = -1 Then
            InputCompanyName.Value = Nothing
            InputCompanyABB.Value = Nothing
            InputCompanyActive.Value = True
        End If
    End Sub

    Protected Sub BTNUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNUpdate.Click
        If CompanySelectPulldown.Value > -1 Then
            CompanyCurRow = CompanyDS.FindByCOMPANY_ID(CompanySelectPulldown.Value)
            If UpdateCompany2DS() = True Then
                cxClass.UpdateCompanies(CompanyDS)
                PopupControl1.Text = "Company Updated."
                PopupControl1.ShowOnPageLoad = True
            Else
                Exit Sub
            End If
        ElseIf CompanySelectPulldown.Value = -1 Then
            'Need code to check if user exist before add to prevent duplicates

            CompanyCurRow = CompanyDS.NewCOMPANIESRow
            If UpdateCompany2DS() = True Then
                CompanyDS.AddCOMPANIESRow(CompanyCurRow)
                cxClass.UpdateCompanies(CompanyDS)
                PopupControl1.Text = "Company Added."
                PopupControl1.ShowOnPageLoad = True

                'reset to blank for new company add
                InputCompanyName.Value = Nothing
                InputCompanyABB.Value = Nothing
                InputCompanyActive.Value = True
            End If
        Else
            Exit Sub
        End If

        '------- Refresh Pulldown after Add ---------------------
        CompanySelectPulldown.Items.Clear()
        CompanySelectPulldown.Items.Add("Add New Company...", -1)
        For Each Me.CompanyCurRow In CompanyDS
            CompanySelectPulldown.Items.Add(CompanyCurRow.COMPANY_NAME.ToString, CompanyCurRow.COMPANY_ID)
        Next
        '----------------------------------------------------------------
    End Sub

    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub

    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub
End Class
