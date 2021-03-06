Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering
Imports System.Web.UI.HtmlControls
Imports System.Collections.Specialized
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxUploadControl
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections.Generic

Partial Class IssueLog
    Inherits System.Web.UI.Page

    Protected DeficiencyDS As New dsCommissioning.DEFICIENCIESDataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PopupControl1.ShowOnPageLoad = False
        If (Not IsPostBack) AndAlso (Not IsCallback) Then

            'Check if user is logged in and display name, send back to login if no current user
            If Not Session.Item("CurUserName") Is Nothing Then
                LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            Else
                Response.Redirect("../UserLogon.aspx")
            End If

            'Send Back to Project Select if no current project
            If Session.Item("CurProjectID") = Nothing Then
                Response.Redirect("ProjectSelect.aspx")
            End If

            'Set Title to display current project name
            If Not Session.Item("CurProjectName") = Nothing Then
                LBLProjName.Value = Session.Item("CurProjectName")
            End If

            'Check for Admin role and assign proper privlages for Edit and Add
            If User.IsInRole("Admin") Then
                BTNAddIssues.Enabled = True
            Else
                G1.Columns.Item(0).Visible = False
                BTNAddIssues.Enabled = False
            End If

        End If

        Try
            G1.DataSource = DeficiencyDS
            G1.KeyFieldName = "ITEM_NUMBER"
            G1.DataBind()
            If (Not IsPostBack) AndAlso (Not IsCallback) Then
                '----Set Edit Layout for Grid Edit Tepmplate-----
                Dim column As GridViewDataColumn = TryCast(G1.Columns("ITEM_DESC"), GridViewDataColumn)
                If column Is Nothing Then
                    Return
                Else
                    column.EditFormSettings.VisibleIndex = 100
                    column.EditFormSettings.ColumnSpan = 3
                    column.EditFormSettings.RowSpan = 2
                End If
                column = TryCast(G1.Columns("ITEM_COMMENT"), GridViewDataColumn)
                If column Is Nothing Then
                    Return
                Else
                    column.EditFormSettings.VisibleIndex = 101
                    column.EditFormSettings.ColumnSpan = 3
                    column.EditFormSettings.RowSpan = 3
                End If
                'If User.IsInRole("Admin") Then
                G1.FilterExpression = "[ITEM_STATUS] = 'Pending Verification' Or [ITEM_STATUS] = 'Open'"
                'End If
                G1.DetailRows.ExpandAllRows()
                G1.SettingsDetail.ShowDetailButtons = False

            End If
            '------------------ end ------------------------

        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try

        '-----Determine Screen Size and Adjust Grid Size ------
        'Dim screensize As System.Drawing.Rectangle
        'screensize = System.Windows.Forms.Screen.GetBounds(New System.Drawing.Point(200, 200))
        'G1.Height = (screensize.Height - 169 - 200)
        '--------------------- end ---------------------------


        'G1.Columns.Item("Btns").Width = System.Web.UI.WebControls.Unit.Pixel(35)
        'G1.Columns.Item("ITEM_NUMBER").Width = System.Web.UI.WebControls.Unit.Pixel(30)
        'G1.Columns.Item("TAG_ID").Width = System.Web.UI.WebControls.Unit.Pixel(70)
        'G1.Columns.Item("DATE_POSTED").Width = System.Web.UI.WebControls.Unit.Pixel(65)
        'G1.Columns.Item("ITEM_STATUS").Width = System.Web.UI.WebControls.Unit.Pixel(75)
        'G1.Columns.Item("COMPANY_ID").Width = System.Web.UI.WebControls.Unit.Pixel(60)
        'G1.Columns.Item("ITEM_DESC").Width = System.Web.UI.WebControls.Unit.Pixel(198)
        'G1.Columns.Item("ITEM_COMMENT").Width = System.Web.UI.WebControls.Unit.Pixel(250)


        ''Restore Current state of Grid and selected row
        If Not (Session.Item("GridControlState") Is Nothing) Then
            Dim GridState As System.Object
            GridState = Session.Item("GridControlState")
            G1.LoadClientLayout(GridState)
            'G1.DataBind()
            Session.Item("GridControlState") = Nothing
        End If

        'If Not Session.Item("CurGridRowKeyValue") Is Nothing Then
        '    Dim keyValue As Integer = Session.Item("CurGridRowKeyValue")
        '    If Not keyValue = Nothing Then
        '        G1.FocusedRowIndex = G1.FindVisibleIndexByKeyValue(keyValue)
        '        'G1.FocusedRowIndex = G1.GetRowByKeyValue(G1.GetGroupCount(), keyValue, True)
        '    End If
        '    Session.Item("CurGridRowKeyValue") = Nothing
        'End If
    End Sub

    Private Sub f(ByRef e As System.EventArgs)

    End Sub

    Protected Sub BTNAddIssues_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNAddIssues.Click
        If Not G1.FocusedRowIndex = Nothing Then
            If Session.Item("CurGridRowKeyValue") Is Nothing Then
                Session.Add("CurGridRowKeyValue", G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER"))
            End If
            Session.Item("CurGridRowKeyValue") = G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER")
            Dim GridState As System.Object
            GridState = G1.SaveClientLayout
            If Session.Item("GridControlState") Is Nothing Then
                Session.Add("GridControlState", GridState)
            End If
            Session.Item("GridControlState") = GridState
        End If
        Response.Redirect("../Admin/AddIssue.aspx")
    End Sub

    Protected Sub BTNAddResponse_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNAddResponse.Click
        Dim CurDefRow As dsCommissioning.DEFICIENCIESRow

        'If Not G1.FocusedRowIndex = Nothing Then
        CurDefRow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER"))
        If Not CurDefRow Is Nothing Then
            If Not CurDefRow.IsITEM_STATUSNull Then
                If CurDefRow.ITEM_STATUS = "Closed" And Not User.IsInRole("Admin") Then
                    PopupControl1.Text = "This item is Closed and no new responses may be added."
                    PopupControl1.ShowOnPageLoad = True
                    Exit Sub
                End If

                If CurDefRow.IsCOMPANY_IDNull And Not User.IsInRole("Admin") Then
                    PopupControl1.Text = "Your Company is not responsible for this item.  You may only respond to items that are assigned to you."
                    PopupControl1.ShowOnPageLoad = True
                    Exit Sub
                Else
                    If Session.Item("CurUserCompanyID") = CurDefRow.COMPANY_ID Or User.IsInRole("Admin") Then

                        If Session.Item("CurGridRowKeyValue") Is Nothing Then
                            Session.Add("CurGridRowKeyValue", G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER"))
                        End If
                        Session.Item("CurGridRowKeyValue") = G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER")
                        Dim GridState As System.Object
                        GridState = G1.SaveClientLayout
                        If Session.Item("GridControlState") Is Nothing Then
                            Session.Add("GridControlState", GridState)
                        End If
                        Session.Item("GridControlState") = GridState

                        ''Preserve Status of filters for return trip done by gridstate

                        Response.Redirect("AddResponse.aspx")

                    Else
                        Dim Company_HeirachyDS As New dsCommissioning.COMPANY_HEIRACHYDataTable
                        cxClass.GetCompany_Heirachy(Session.Item("CurProjectID"), Company_HeirachyDS)
                        Dim Company_HeirachyCurRow As dsCommissioning.COMPANY_HEIRACHYRow
                        Dim IsParentCompany As Boolean = False

                        For Each Company_HeirachyCurRow In Company_HeirachyDS
                            If CurDefRow.COMPANY_ID = Company_HeirachyCurRow.SUB_COMPANY_ID Then
                                If Company_HeirachyCurRow.PARENT_COMPANY_ID = Session.Item("CurUserCompanyID") Then
                                    IsParentCompany = True
                                    Exit For
                                End If
                            End If
                        Next

                        If IsParentCompany = False Then
                            PopupControl1.Text = "Your Company is not responsible for this item.  You may only respond to items that are assigned to you."
                            PopupControl1.ShowOnPageLoad = True
                            Exit Sub
                        Else
                            If Session.Item("CurGridRowKeyValue") Is Nothing Then
                                Session.Add("CurGridRowKeyValue", G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER"))
                            End If
                            Session.Item("CurGridRowKeyValue") = G1.GetRowValues(G1.FocusedRowIndex, "ITEM_NUMBER")
                            Dim GridState As System.Object
                            GridState = G1.SaveClientLayout
                            If Session.Item("GridControlState") Is Nothing Then
                                Session.Add("GridControlState", GridState)
                            End If
                            Session.Item("GridControlState") = GridState

                            ''Preserve Status of filters for return trip
                            Response.Redirect("AddResponse.aspx")
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub BTNCompanyKey_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCompanyKey.Click
        Dim CompanyKeyDS As dsCommissioning.COMPANIESDataTable
        CompanyKeyDS = cxClass.GetCompanies(Session.Item("CurProjectID"), False)

        Dim CompanyKey As String = ""
        Dim CompanyCurRow As dsCommissioning.COMPANIESRow
        CompanyKey &= vbCrLf
        For Each CompanyCurRow In CompanyKeyDS
            CompanyKey &= CompanyCurRow.COMPANY_ABB.ToString & " - " & CompanyCurRow.COMPANY_NAME.ToString & vbCrLf
        Next
        PopupControl2.HeaderText = Session.Item("CurProjectName").ToString
        PopupControl2.Text = CompanyKey
        PopupControl2.ShowOnPageLoad = True
    End Sub

    Protected Sub BTNContacts_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNContacts.Click
        Response.Redirect("ContactRPT.aspx")
    End Sub

    Protected Sub G1_AutoFilterCellEditorCreate(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorCreateEventArgs) Handles G1.AutoFilterCellEditorCreate
        If e.Column.FieldName = "DATE_POSTED" Then
            Dim combo As New ComboBoxProperties()
            e.EditorProperties = combo
        End If
        If e.Column.FieldName = "ITEM_STATUS" Then
            Dim combo As New ComboBoxProperties()
            e.EditorProperties = combo
        End If
    End Sub

    Protected Sub G1_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs) Handles G1.AutoFilterCellEditorInitialize
        If TypeOf e.Editor Is ASPxComboBox Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
            If e.Column.FieldName = "DATE_POSTED" Then
                combo.ValueType = GetType(Int32)

                combo.Items.Add("today", 0)
                combo.Items.Add("yesterday", 1)
                combo.Items.Add("this week", 2)
                combo.Items.Add("last week", 3)
                combo.Items.Add("this month", 4)
                combo.Items.Add("last month", 5)
                combo.Items.Add("this year", 6)
                combo.Items.Add("last year", 7)
            End If
            If e.Column.FieldName = "ITEM_STATUS" Then
                combo.ValueType = GetType(Int32)

                combo.Items.Add("Open", 0)
                combo.Items.Add("Pending Verification", 1)
                combo.Items.Add("Open and Pending", 2)
                combo.Items.Add("Closed", 3)
            End If

        End If
    End Sub

    Protected Sub G1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles G1.DataBinding
        DeficiencyDS.Clear()
        cxClass.GetDeficiencies(Session.Item("CurProjectID"), 0, "All", DeficiencyDS)
    End Sub

    Protected Sub G1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles G1.DataBound
        'If Not Session.Item("CurGridRowKeyValue") Is Nothing Then
        '    Dim keyValue As Integer = Session.Item("CurGridRowKeyValue")
        '    If Not keyValue = Nothing Then
        '        G1.FocusedRowIndex = G1.FindVisibleIndexByKeyValue(keyValue)
        '        'G1.FocusedRowIndex = G1.GetRowByKeyValue(G1.GetGroupCount(), keyValue, True)
        '    End If
        '    Session.Item("CurGridRowKeyValue") = Nothing
        'End If
    End Sub

    Protected Sub G1_ProcessColumnAutoFilter(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewAutoFilterEventArgs) Handles G1.ProcessColumnAutoFilter


        If e.Kind <> GridViewAutoFilterEventKind.CreateCriteria Then
            If e.Column.FieldName = "DATE_POSTED" Then
                Dim value = Convert.ToDateTime(e.Value)
                Dim start As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
                start = start.Add(New TimeSpan(1, 0, 0, 0))
                Dim [end] As DateTime = start.Add(New TimeSpan(1, 0, 0, 0))

                If (value >= start.Subtract(New TimeSpan(1, 0, 0, 0)) And (value <= [end])) Then
                    e.Value = "today"
                ElseIf (value >= start.Subtract(New TimeSpan(2, 0, 0, 0)) And (value <= [end].Subtract(New TimeSpan(1, 0, 0, 0)))) Then
                    e.Value = "yesterday"
                ElseIf (value >= start.Subtract(New TimeSpan(7, 0, 0, 0)) And (value <= [end])) Then
                    e.Value = "this week"
                ElseIf (value >= start.Subtract(New TimeSpan(14, 0, 0, 0)) And (value <= [end].Subtract(New TimeSpan(7, 0, 0, 0)))) Then
                    e.Value = "last week"
                    ' and so on 
                ElseIf (value >= New DateTime(DateTime.Now.Year, DateTime.Now.Month, 1) And (value <= [end])) Then
                    e.Value = "this month"
                ElseIf (value >= New DateTime(DateTime.Now.Year, DateTime.Now.Month - 1, 1) And (value <= New DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).Subtract(New TimeSpan(1, 0, 0, 0)))) Then
                    e.Value = "last month"
                ElseIf (value >= New DateTime(DateTime.Now.Year, 1, 1) And (value <= [end])) Then
                    e.Value = "this year"
                ElseIf (value >= New DateTime(DateTime.Now.Year - 1, 1, 1) And (value <= New DateTime(DateTime.Now.Year, 1, 1).Subtract(New TimeSpan(1, 0, 0, 0)))) Then
                    e.Value = "last year"
                End If
                Return
            End If
            If e.Column.FieldName = "ITEM_STATUS" Then
                Dim value = e.Value.ToString

                If (value = "Open") Then
                    e.Value = "Open"
                ElseIf (value = "Pending Verification") Then
                    e.Value = "Pending Verification"
                ElseIf ((value = "Pending Verification") Or (value = "Open")) Then
                    e.Value = "Open and Pending"
                ElseIf (value = "Closed") Then
                    e.Value = "Closed"
                    ' and so on 
                End If
                Return
            End If

        End If
        If e.Column.FieldName = "DATE_POSTED" Then

            Dim start As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
            start = start.Add(New TimeSpan(1, 0, 0, 0))
            Dim [end] As DateTime = start

            If e.Value.ToString() = "0" Then
                start = start.Subtract(New TimeSpan(1, 0, 0, 0))
            ElseIf e.Value.ToString() = "1" Then
                start = start.Subtract(New TimeSpan(2, 0, 0, 0))
                [end] = [end].Subtract(New TimeSpan(1, 0, 0, 0))
            ElseIf e.Value.ToString() = "2" Then
                start = start.Subtract(New TimeSpan(7, 0, 0, 0))
            ElseIf e.Value.ToString() = "3" Then
                start = start.Subtract(New TimeSpan(14, 0, 0, 0))
                [end] = [end].Subtract(New TimeSpan(7, 0, 0, 0))
            ElseIf e.Value.ToString() = "4" Then
                start = New DateTime(DateTime.Now.Year, DateTime.Now.Month, 1)
            ElseIf e.Value.ToString() = "5" Then
                start = New DateTime(DateTime.Now.Year, DateTime.Now.Month - 1, 1)
                [end] = New DateTime(DateTime.Now.Year, DateTime.Now.Month, 1)
                [end] = [end].Subtract(New TimeSpan(1, 0, 0, 0))
            ElseIf e.Value.ToString() = "6" Then
                start = New DateTime(DateTime.Now.Year, 1, 1)
            ElseIf e.Value.ToString() = "7" Then
                start = New DateTime(DateTime.Now.Year - 1, 1, 1)
                [end] = New DateTime(DateTime.Now.Year, 1, 1)
                [end] = [end].Subtract(New TimeSpan(1, 0, 0, 0))
            End If

            e.Criteria = New GroupOperator(GroupOperatorType.And, New BinaryOperator(e.Column.FieldName, start, BinaryOperatorType.GreaterOrEqual), New BinaryOperator(e.Column.FieldName, [end], BinaryOperatorType.LessOrEqual))
        End If

        If e.Column.FieldName = "ITEM_STATUS" Then

            Dim start As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
            start = start.Add(New TimeSpan(1, 0, 0, 0))
            Dim [end] As DateTime = start

            If e.Value.ToString() = "0" Then
                e.Criteria = New BinaryOperator(e.Column.FieldName, "Open", BinaryOperatorType.Equal)
            ElseIf e.Value.ToString() = "1" Then
                e.Criteria = New BinaryOperator(e.Column.FieldName, "Pending Verification", BinaryOperatorType.Equal)
            ElseIf e.Value.ToString() = "2" Then
                e.Criteria = New GroupOperator(GroupOperatorType.Or, New BinaryOperator(e.Column.FieldName, "Open", BinaryOperatorType.Equal), New BinaryOperator(e.Column.FieldName, "Pending Verification", BinaryOperatorType.Equal))
            ElseIf e.Value.ToString() = "3" Then
                e.Criteria = New BinaryOperator(e.Column.FieldName, "Closed", BinaryOperatorType.Equal)
            End If
        End If
    End Sub

    Protected Sub G1_RowDeleting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles G1.RowDeleting
        Dim updatedrow As dsCommissioning.DEFICIENCIESRow
        updatedrow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), e.Keys("ITEM_NUMBER"))
        If Not updatedrow Is Nothing Then
            updatedrow.Delete()
        End If
        cxClass.UpdateDeficiencies(DeficiencyDS)
        e.Cancel = True
        G1.DataBind()
    End Sub
    Protected Sub G1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles G1.RowInserting
        Dim updatedrow As dsCommissioning.DEFICIENCIESRow
        updatedrow("PROJECT_ID") = Session.Item("CurProjectID")
        updatedrow("TAG_ID") = e.NewValues("TAG_ID")
        updatedrow("ITEM_STATUS") = e.NewValues("ITEM_STATUS")
        updatedrow("COMPANY_ID") = e.NewValues("COMPANY_ID")
        updatedrow("ITEM_DESC") = e.NewValues("ITEM_DESC")
        updatedrow("ITEM_COMMENT") = e.NewValues("ITEM_COMMENT")
        updatedrow("DATE_POSTED") = Date.Now
        DeficiencyDS.Rows.Add(updatedrow)
        cxClass.UpdateDeficiencies(DeficiencyDS)
        e.Cancel = True
        G1.CancelEdit()

    End Sub
    Protected Sub G1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles G1.RowUpdating
        Dim updatedrow As dsCommissioning.DEFICIENCIESRow
        updatedrow = DeficiencyDS.FindByPROJECT_IDITEM_NUMBER(Session.Item("CurProjectID"), e.Keys("ITEM_NUMBER"))
        If Not updatedrow Is Nothing Then
            updatedrow("TAG_ID") = e.NewValues("TAG_ID")
            updatedrow("ITEM_STATUS") = e.NewValues("ITEM_STATUS")
            updatedrow("COMPANY_ID") = e.NewValues("COMPANY_ID")
            updatedrow("ITEM_DESC") = e.NewValues("ITEM_DESC")
            updatedrow("ITEM_COMMENT") = e.NewValues("ITEM_COMMENT")
            'updatedrow("DATE_POSTED") = e.NewValues("DATE_POSTED")
        End If
        cxClass.UpdateDeficiencies(DeficiencyDS)

        e.Cancel = True
        G1.CancelEdit()
        'G1.DataBind()
    End Sub

    Protected Sub BTNIssuesReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNIssuesReport.Click
        Session.Add("FilterString", G1.FilterExpression)
        Dim TempCol As New DevExpress.Web.ASPxGridView.GridViewDataColumn
        TempCol = G1.GetSortedColumns(0)
        Session.Add("GridSort", TempCol.FieldName.ToString())

        Response.Redirect("IssueRPT.aspx")
    End Sub

    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub

    Protected Sub ASPxGridView2_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("ITEM_NUMBER") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
        If Not User.IsInRole("Admin") Then
            TryCast(sender, ASPxGridView).Columns.Item(0).Visible = False
        End If
    End Sub


    Protected Sub ASPxGridView2_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        If (Not Url = Nothing) Then
            Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
            Dim textBox As ASPxTextBox = TryCast(FindPageControl(grid).FindControl("txbDesc"), ASPxTextBox)
            'New Code-----------
            'Dim fileUpload As ASPxUploadControl = TryCast(FindPageControl(grid).FindControl("ASPxUploadControl1"), ASPxUploadControl)   'New Code-----------
            e.NewValues("Description") = textBox.Text
            e.NewValues("ID") = Guid.NewGuid().ToString().Replace("-", "")
            e.NewValues("PROJECT_ID") = Session.Item("CurProjectID")
            e.NewValues("ITEM_NUMBER") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue() 'Session.Item("ITEM_NUMBER")
            e.NewValues("Url") = "~/Uploads/" & Session.Item("CurProjectID") & "/" & genId1 & Url
            e.Cancel = Not SaveFileBytesToRow(grid, e.NewValues)
            'ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('File size can not be more than 2MB. Please Select a valid File');", True)
        Else
            ScriptManager.RegisterStartupScript(Me, [GetType](), "showalert", "alert('File size can not be more than 2MB. Please Select a valid File');", True)
            PopupControl1.Text = "Hello"
            PopupControl1.ShowOnPageLoad = True
        End If
    End Sub

    Shared Url As String
    Private Shared genId As String
    Public Function MakeUnique() As String
        Dim newId As String
        newId = RandomPassword.Generate(4, 4)
        genId = newId
        Return newId
    End Function
    Private Shared genId1 As String
    Private Shared genId2 As String
    Private Shared genId3 As String
    Private Shared size As Integer

    Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)
        If TryCast(sender, ASPxUploadControl).IsValid Then
            Session("data") = TryCast(sender, ASPxUploadControl).FileBytes
            Url = TryCast(sender, ASPxUploadControl).FileName
            Dim folderPath As String = Server.MapPath("~/Uploads/" & Session.Item("CurProjectID") & "/")
            If Not Directory.Exists(folderPath) Then
                Directory.CreateDirectory(folderPath)
            End If
            Dim extension As String = Path.GetExtension(sender.UploadedFiles(0).FileName)
            size = sender.UploadedFiles(0).PostedFile.ContentLength
            If (extension.ToLower = ".jpeg" Or extension.ToLower = ".jpg" Or extension.ToLower = ".png") Then
                Dim strm As Stream = sender.UploadedFiles(0).PostedFile.InputStream
                Using image = System.Drawing.Image.FromStream(strm)
                    ' Print Original Size of file (Height or Width)   
                    Dim img_height As Integer
                    img_height = image.Height
                    Dim img_width As Integer
                    img_width = image.Width
                    Dim newWidth As Integer '= image.Width / 10
                    ' New Width of Image in Pixel  
                    Dim newHeight As Integer '= image.Height / 10
                    If (img_height > 1441 AndAlso img_width > 2197) Then
                        newHeight = 1400
                        newWidth = 2100
                    Else
                        newHeight = image.Height
                        newWidth = image.Width
                    End If

                    Dim thumbImg = New System.Drawing.Bitmap(newWidth, newHeight)
                    Dim thumbGraph = Graphics.FromImage(thumbImg)
                    thumbGraph.CompositingQuality = CompositingQuality.HighQuality
                    thumbGraph.SmoothingMode = SmoothingMode.HighQuality
                    thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic
                    Dim imgRectangle = New Rectangle(0, 0, newWidth, newHeight)
                    thumbGraph.DrawImage(image, imgRectangle)
                    ' Save the file  
                    genId1 = MakeUnique()
                    Dim targetPath As String = folderPath & Path.GetFileName(genId1 & sender.UploadedFiles(0).FileName)
                    thumbImg.Save(targetPath, image.RawFormat)
                    ' Print new Size of file (height or Width)  

                    'Show Image  

                End Using
            ElseIf (size / (1024 * 1024) <= 2) Then
                genId1 = MakeUnique()
                sender.UploadedFiles(0).SaveAs(folderPath & System.IO.Path.GetFileName(genId1 & sender.UploadedFiles(0).FileName))

            Else
                Url = Nothing
            End If
        End If
    End Sub

    Protected Function SaveFileBytesToRow(ByVal grid As ASPxGridView, ByVal newValues As OrderedDictionary) As Boolean
        Dim ret As Boolean = True
        If Session("data") IsNot Nothing Then
            newValues("Bytes") = Session("data")
            'uploader.FileBytes;
            Session.Remove("data")
        Else
            ret = False
        End If
        Return ret
    End Function

    Private Function FindPageControl(ByVal grid As ASPxGridView) As ASPxPageControl
        Return TryCast(grid.FindEditFormTemplateControl("pageControl"), ASPxPageControl)
    End Function


    Protected Function GetFileUploadComplete(ByVal container As Object) As String
        ' container is a TabControl in this example
        Dim pageControl As ASPxPageControl = DirectCast(container, ASPxPageControl)
        Dim editFormTemplate As GridViewEditFormTemplateContainer = DirectCast(pageControl.Parent, GridViewEditFormTemplateContainer)
        Dim gridClientInstance As String = editFormTemplate.Grid.ClientInstanceName
        Return "function(s, e) { DetailGridUpdateEdit(e, " & gridClientInstance & "); }"
    End Function



    Protected Sub ASPxGridView2_CustomErrorText(sender As Object, e As ASPxGridViewCustomErrorTextEventArgs)
        If e.Exception IsNot Nothing Then
            e.ErrorText = "File size can not be more than 2MB. Please Select a valid File"
        End If
    End Sub

    Dim sql_con As SqlConnection
    Dim cmd As SqlCommand
    Dim str As String = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString
    Protected Sub LinkButtonGeneratePDF_Click(sender As Object, e As EventArgs) Handles LinkButtonGeneratePDF.Click
        'sql_con = New SqlConnection(str)
        'cmd = New SqlCommand("IF Not EXISTS(SELECT PROJECT_ID, SELECTED_IND FROM REPORT where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND) INSERT INTO REPORT VALUES(@PROJECT_ID,@SELECTED_IND) Else update  REPORT set SELECTED_IND=@SELECTED_IND where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND", sql_con)
        Dim abc As Boolean
        Try
            For Each item As ListItem In listCompany.Items
                If item.Selected Then
                    'YrStrList.Add(item.Value)
                    abc = issueEmail.GetIssueList(Session.Item("CurProjectID"), item.Value)
                    'PopupControl1.ShowOnPageLoad = True
                    'cmd.Parameters.Clear()
                    'cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
                    'cmd.Parameters.AddWithValue("@SELECTED_IND", listCompany.Items.IndexOf(item))
                    'sql_con.Open()
                    'cmd.ExecuteNonQuery()
                    'sql_con.Close()
                Else
                    abc = issueEmail.GetIssueListI(Session.Item("CurProjectID"), item.Value)
                    'cmd = New SqlCommand("IF EXISTS(SELECT PROJECT_ID, SELECTED_IND FROM REPORT where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND) Delete from REPORT WHERE PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND", sql_con)
                    'cmd.Parameters.Clear()
                    'cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
                    'cmd.Parameters.AddWithValue("@SELECTED_IND", listCompany.Items.IndexOf(item))
                    'sql_con.Open()
                    'cmd.ExecuteNonQuery()
                    'sql_con.Close()
                End If
            Next
            If (abc = True) Then
                PopupControl1.Text = "Message sent to user..."
                PopupControl1.ShowOnPageLoad = True
            Else
                PopupControl1.Text = "Error occurred..."
                PopupControl1.ShowOnPageLoad = True
            End If
            'abc = issueEmail.GetIssueList(Session.Item("CurProjectID"), Nothing)
            'Dim YrStr As [String] = [String].Join(";", YrStrList.ToArray())
            'Response.Write(String.Concat("Selected Items: ", YrStr))
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
        'Dim YrStrList As List(Of [String]) = New List(Of String)()
    End Sub

    Protected Sub listCompany_SelectedIndexChanged(sender As Object, e As EventArgs) Handles listCompany.SelectedIndexChanged

    End Sub
    Protected Function getIndex() As Boolean
        Dim i As Integer
        sql_con = New SqlConnection(str)
        cmd = New SqlCommand("Select SELECTED_IND FROM REPORT", sql_con)
        sql_con.Open()

        Dim items As List(Of Integer) = New List(Of Integer)()

        Using sdr As SqlDataReader = cmd.ExecuteReader()
            While sdr.Read()
                items.Add(sdr(0))
            End While
        End Using


        For j As Integer = 0 To listCompany.Items.Count - 1
            Dim id As Integer
            ''            id = listCompany.Items(0).Value

            ''If (items.Contains(id)) Then
            If (items.Contains(j)) Then
                listCompany.Items(j).Selected = True
            End If

        Next j

        sql_con.Close()
        Return True
    End Function
    Protected Sub listCompany_Load(sender As Object, e As EventArgs) Handles listCompany.Load

    End Sub
    Protected Sub listCompany_DataBound(sender As Object, e As EventArgs)
        getIndex()
    End Sub
    Protected Sub LinkButtonSave_Click(sender As Object, e As EventArgs) Handles LinkButtonSave.Click
        sql_con = New SqlConnection(str)
        cmd = New SqlCommand("IF Not EXISTS(SELECT PROJECT_ID, SELECTED_IND FROM REPORT where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND) INSERT INTO REPORT VALUES(@PROJECT_ID,@SELECTED_IND) Else update  REPORT set SELECTED_IND=@SELECTED_IND where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND", sql_con)
        For Each item As ListItem In listCompany.Items
            If item.Selected Then
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
                cmd.Parameters.AddWithValue("@SELECTED_IND", listCompany.Items.IndexOf(item))
                sql_con.Open()
                cmd.ExecuteNonQuery()
                sql_con.Close()
                PopupControl1.Text = "Record Saved."
                PopupControl1.ShowOnPageLoad = True
            Else
                cmd = New SqlCommand("IF EXISTS(SELECT PROJECT_ID, SELECTED_IND FROM REPORT where PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND) Delete from REPORT WHERE PROJECT_ID=@PROJECT_ID and SELECTED_IND=@SELECTED_IND", sql_con)
                cmd.Parameters.Clear()
                cmd.Parameters.AddWithValue("@PROJECT_ID", Session.Item("CurProjectID"))
                cmd.Parameters.AddWithValue("@SELECTED_IND", listCompany.Items.IndexOf(item))
                sql_con.Open()
                cmd.ExecuteNonQuery()
                sql_con.Close()
                PopupControl1.Text = "Record Saved."
                PopupControl1.ShowOnPageLoad = True
            End If
        Next
    End Sub
End Class
