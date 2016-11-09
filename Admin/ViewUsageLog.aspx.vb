Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Data.Filtering
Imports System.Web.UI.HtmlControls

Partial Class Admin_ViewUsageLog
    Inherits System.Web.UI.Page

    Protected Usage_LogDS As New dsCommissioning.USAGE_LOGDataTable
    Protected UsersFilterDS As dsCommissioning.USERSDataTable
    Protected ProjectFilterDS As dsCommissioning.PROJECTSDataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'If Not Session.Item("CurUserName") Is Nothing Then
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("../UserLogon.aspx")
            'End If
        End If

        G1.DataSource = Usage_LogDS
        G1.AutoGenerateColumns = False
        G1.KeyFieldName = "INDEX"
        G1.DataBind()

        ''------- Set default Filter to 1 Month Length------------
        'If (Not IsPostBack) AndAlso (Not IsCallback) Then
        '    Dim pDate As Date = Date.Today
        '    Dim pDayOffset As New TimeSpan(31, 0, 0, 0)
        '    pDate = pDate.Subtract(pDayOffset)
        '    G1.FilterExpression = "[LOGIN_TIME] >= #" & pDate & "# And [LOGIN_TIME] <= #" & Date.Now.AddDays(1) & "#"
        'End If
        ''-----------------------end-----------------------------

        'G1.Columns.ColumnByFieldName("USER_ID").Width = System.Web.UI.WebControls.Unit.Pixel(125)
        'G1.Columns.ColumnByFieldName("PROJECT_ID").Width = System.Web.UI.WebControls.Unit.Pixel(161)
        'G1.Columns.ColumnByFieldName("LOGIN_TIME").Width = System.Web.UI.WebControls.Unit.Pixel(130)

    End Sub


    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub
    Protected Sub G1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles G1.DataBinding
        cxClass.GetUsage_Log(Usage_LogDS)
    End Sub

    'Protected Sub G1_HeaderFilterFillItems(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewHeaderFilterEventArgs) Handles G1.HeaderFilterFillItems
    '    If Not e.Column.FieldName = "LOGIN_TIME" Then
    '        Return
    '    End If

    '    e.Values.Clear()
    '    e.AddShowAll()
    '    e.AddValue("This week", String.Empty, String.Format("[LOGIN_TIME] >= #{0}#", (DateAdd(DateInterval.WeekOfYear, -1, Date.Now))))
    '    e.AddValue("Two Weeks", String.Empty, String.Format("[LOGIN_TIME] >= #{0}#", (DateAdd(DateInterval.WeekOfYear, -2, Date.Now))))
    '    e.AddValue("This Month", String.Empty, String.Format("[LOGIN_TIME] >= #{0}#", (DateAdd(DateInterval.Month, -1, Date.Now))))
    '    e.AddValue("This Year", String.Empty, String.Format("[LOGIN_TIME] >= #{0}#", (DateAdd(DateInterval.Year, -1, Date.Now))))
    'End Sub


    Protected Sub G1_AutoFilterCellEditorCreate(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorCreateEventArgs) Handles G1.AutoFilterCellEditorCreate
        If e.Column.FieldName = "LOGIN_TIME" Then
            Dim combo As New ComboBoxProperties()
            e.EditorProperties = combo
        End If
    End Sub

    Protected Sub G1_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs) Handles G1.AutoFilterCellEditorInitialize
        If TypeOf e.Editor Is ASPxComboBox Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
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
    End Sub

    Protected Sub G1_ProcessColumnAutoFilter(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewAutoFilterEventArgs) Handles G1.ProcessColumnAutoFilter


        If e.Kind <> GridViewAutoFilterEventKind.CreateCriteria Then
            If e.Column.FieldName = "LOGIN_TIME" Then
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


        End If
        If e.Column.FieldName = "LOGIN_TIME" Then

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
    End Sub
End Class
