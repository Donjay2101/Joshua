Imports System.Data.SqlClient
Imports System.Data
Partial Class AddProject
    Inherits System.Web.UI.Page

    Protected ProjectDS As dsCommissioning.PROJECTSDataTable
    Protected ProjectCurRow As dsCommissioning.PROJECTSRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'If Not Session.Item("CurUserName") Is Nothing Then
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("../UserLogon.aspx")
            'End If

            ProjectSelectPulldown.Value = -1
            InputProjectNumber.Value = Nothing
            InputProjectName.Value = Nothing
            InputProjectLocation.Value = Nothing
            InputLeadCA.Value = Nothing
            InputLeadCAEmail.Value = Nothing
            InputProjectDescription.Text = Nothing
            InputProjectClosed.Value = False
            InputProjectOwner.Value = Nothing
            MakeProjectNumber()
            InputComNoticeIntro.Value = "The Construction Manager is asked to ensure that all issues noted on the commissioning notice are corrected in a timely manner.  It is crucial to the commissioning process that the Commissioning Portal is updated after the corrections have been made. Once the Portal has been updated, the commissioning provider will verify the completion of all outstanding items and the issue will be closed."
            'InputComNoticeIntro.Value = "Construction Manager is asked to distribute this commissioning notice to all parties for their review and comment. Once the corrections have been made, the commissioning notice shall be returned to BVH indicating all corrections are complete or exceptions have been taken. BVHis will verify their completion of all outstanding items."
        End If

        ProjectDS = cxClass.GetProjects(0, True, True, Session.Item("CurUserID"))
        ProjectSelectPulldown.Items.Clear()
        ProjectSelectPulldown.Items.Add("Add New Project...", -1)
        For Each Me.ProjectCurRow In ProjectDS
            ProjectSelectPulldown.Items.Add(ProjectCurRow.PROJECT_NAME.ToString, ProjectCurRow.PROJECT_ID)
        Next

    End Sub

    Private Function MakeProjectNumber() As Boolean
        Dim ConnStr As String = "Data Source = .;Initial Catalog=cxExample;Integrated Security=false;user id=sa;password=hello;"
        'Dim ConnStr As String = "Data Source=192.99.144.236;Initial Catalog=cxExample;user id=sqluser;password=user123;"
        Dim Conn As New SqlConnection(ConnStr)
        Dim sda As SqlDataAdapter
        Dim sds As DataSet
        Dim cmd As SqlCommand
        cmd = New SqlCommand("Select  top (1) PROJECT_NUMBER from PROJECTS ORDER BY PROJECT_NUMBER desc", Conn)
        cmd.CommandType = CommandType.Text
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        sds = New DataSet()
        sda.Fill(sds)

        Dim str As String
        str = sds.Tables(0).Rows(0)(0)
        Dim prjNum As Integer
        prjNum = Convert.ToInt32(str)

        Dim sprj As String
        Dim yr As String
        yr = "21"
        yr += DateTime.Now.ToString("yy")

        prjNum = prjNum Mod 1000
        If (prjNum < 10) Then
            sprj = "00" & Convert.ToString(prjNum + 1)
        ElseIf (prjNum < 100) Then
            sprj = "0" & Convert.ToString(prjNum + 1)
        Else
            sprj = Convert.ToString(prjNum + 1)
        End If

        yr += sprj
        InputProjectNumber.Text = yr
        Return True
    End Function
    Private Function UpdateProject2Dataset() As Boolean

        If Regex.IsMatch(InputProjectNumber.Value, "([0-9]{7})|([0-9]{7}[\.][0-9]{2})") Then
            ProjectCurRow.PROJECT_NUMBER = InputProjectNumber.Value
        Else
            PopupControl1.Text = "Project Number is missing or Incorrect Format."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If
        If Not InputProjectName.Value Is Nothing Then
            ProjectCurRow.PROJECT_NAME = InputProjectName.Value
        Else
            PopupControl1.Text = "Project Name is required.  Please enter a Project Name."
            PopupControl1.ShowOnPageLoad = True
            Return False
        End If

        If Not InputProjectLocation.Value Is Nothing Then
            ProjectCurRow.PROJECT_LOC = InputProjectLocation.Value
        Else
            ProjectCurRow.SetPROJECT_LOCNull()
        End If
        If Not InputLeadCA.Value Is Nothing Then
            ProjectCurRow.PROJECT_LEED_CA = InputLeadCA.Value
        Else
            ProjectCurRow.SetPROJECT_LEED_CANull()
        End If
        If Not InputLeadCAEmail.Value Is Nothing Then
            If Regex.IsMatch(InputLeadCAEmail.Value, "^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$") Then
                ProjectCurRow.PROJECT_LEED_EMAIL = InputLeadCAEmail.Value
            Else
                PopupControl1.Text = "Email Format is invalid, please enter a Valid email address."
                PopupControl1.ShowOnPageLoad = True
                Return False
            End If
        Else
            ProjectCurRow.SetPROJECT_LEED_EMAILNull()
        End If
        If Not InputProjectDescription.Text Is Nothing Then
            ProjectCurRow.PROJECT_DESC = InputProjectDescription.Text
        Else
            ProjectCurRow.SetPROJECT_DESCNull()
        End If
        If Not InputProjectClosed.Value Is Nothing Then
            ProjectCurRow.PROJECT_CLOSED = InputProjectClosed.Value
        Else
            ProjectCurRow.SetPROJECT_CLOSEDNull()
        End If
        If Not InputProjectOwner.Value Is Nothing Then
            ProjectCurRow.PROJECT_OWNER = InputProjectOwner.Value
        Else
            ProjectCurRow.SetPROJECT_OWNERNull()
        End If
        If Not InputComNoticeIntro.Value Is Nothing Then
            ProjectCurRow.PROJECT_COMNOTICE_INFO = InputComNoticeIntro.Value
        Else
            ProjectCurRow.SetPROJECT_COMNOTICE_INFONull()
        End If

        Return True
    End Function

    Protected Sub ProjectSelectPulldown_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles ProjectSelectPulldown.SelectedIndexChanged
        ProjectCurRow = ProjectDS.FindByPROJECT_ID(ProjectSelectPulldown.Value)
        If ProjectSelectPulldown.Value > -1 And Not ProjectCurRow Is Nothing Then
            InputProjectNumber.Value = ProjectCurRow.PROJECT_NUMBER.ToString
            InputProjectName.Value = ProjectCurRow.PROJECT_NAME.ToString
            If Not ProjectCurRow.IsPROJECT_LOCNull Then
                InputProjectLocation.Value = ProjectCurRow.PROJECT_LOC.ToString
            End If
            If Not ProjectCurRow.IsPROJECT_LEED_CANull Then
                InputLeadCA.Value = ProjectCurRow.PROJECT_LEED_CA.ToString
            End If
            If Not ProjectCurRow.IsPROJECT_LEED_EMAILNull Then
                InputLeadCAEmail.Value = ProjectCurRow.PROJECT_LEED_EMAIL.ToString
            End If
            If Not ProjectCurRow.IsPROJECT_DESCNull Then
                InputProjectDescription.Text = ProjectCurRow.PROJECT_DESC.ToString
            End If
            If Not ProjectCurRow.IsPROJECT_CLOSEDNull Then
                InputProjectClosed.Value = ProjectCurRow.PROJECT_CLOSED
            End If
            If Not ProjectCurRow.IsPROJECT_OWNERNull Then
                InputProjectOwner.Value = ProjectCurRow.PROJECT_OWNER.ToString
            End If
            If Not ProjectCurRow.IsPROJECT_COMNOTICE_INFONull Then
                InputComNoticeIntro.Value = ProjectCurRow.PROJECT_COMNOTICE_INFO.ToString
            End If
        ElseIf ProjectSelectPulldown.Value = -1 Then
            InputProjectNumber.Value = Nothing
            InputProjectName.Value = Nothing
            InputProjectLocation.Value = Nothing
            InputLeadCA.Value = Nothing
            InputLeadCAEmail.Value = Nothing
            InputProjectDescription.Text = Nothing
            InputProjectClosed.Value = False
            InputProjectOwner.Value = Nothing
            MakeProjectNumber()
            InputComNoticeIntro.Value = "Construction Manager is asked to distribute this commissioning notice to all parties for their review and comment. Once the corrections have been made, the commissioning notice shall be returned to BVH indicating all corrections are complete or exceptions have been taken. BVHis will verify their completion of all outstanding items."
        End If
    End Sub

    Protected Sub BTNUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNUpdate.Click
        If ProjectSelectPulldown.Value > -1 Then
            ProjectCurRow = ProjectDS.FindByPROJECT_ID(ProjectSelectPulldown.Value)
            If UpdateProject2Dataset() = True Then
                cxClass.UpdateProjects(ProjectDS)
                PopupControl1.Text = "Project Information Updated."
                PopupControl1.ShowOnPageLoad = True
            Else
                Exit Sub
            End If
        ElseIf ProjectSelectPulldown.Value = -1 Then
            'Need code to check if user exist before add to prevent duplicates
            ProjectCurRow = ProjectDS.NewPROJECTSRow()
            If UpdateProject2Dataset() = True Then
                ProjectDS.AddPROJECTSRow(ProjectCurRow)
                cxClass.UpdateProjects(ProjectDS)
                PopupControl1.Text = "Project Added to Portal."
                PopupControl1.ShowOnPageLoad = True

                'reset fields to blank for new add
                InputProjectNumber.Value = Nothing
                InputProjectName.Value = Nothing
                InputProjectLocation.Value = Nothing
                InputLeadCA.Value = Nothing
                InputLeadCAEmail.Value = Nothing
                InputProjectDescription.Text = Nothing
                InputProjectClosed.Value = False
                InputProjectOwner.Value = Nothing
                MakeProjectNumber()
                InputComNoticeIntro.Value = "Construction Manager is asked to distribute this commissioning notice to all parties for their review and comment. Once the corrections have been made, the commissioning notice shall be returned to BVH indicating all corrections are complete or exceptions have been taken. BVHis will verify their completion of all outstanding items."
            Else
                Exit Sub
            End If
        End If

        '------- refresh the pulldown after adding a company------------
        ProjectSelectPulldown.Items.Clear()
        ProjectSelectPulldown.Items.Add("Add New Project...", -1)
        For Each Me.ProjectCurRow In ProjectDS
            ProjectSelectPulldown.Items.Add(ProjectCurRow.PROJECT_NAME.ToString, ProjectCurRow.PROJECT_ID)
        Next
        '------------------------------------------------------------------


        'Anyway to add the Starting roles that are needed for a new project
    End Sub
    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/ProjectSelect.aspx")
    End Sub


    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub
End Class
