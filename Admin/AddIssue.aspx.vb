Imports System.Data.SqlClient
Imports System.Data
Imports DevExpress.Web.ASPxUploadControl
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class AddIssue
    Inherits System.Web.UI.Page

    Protected DeficiencyDS As New dsCommissioning.DEFICIENCIESDataTable
    Protected CompanyDS As dsCommissioning.COMPANIESDataTable
    Public rowcount As Integer = 0
    'Protected url As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        rowcount = 0
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            'If Not Session.Item("CurUserName") Is Nothing Then
            '    LBLCurUser.Text = "Welcome, " & Session.Item("CurUserName")
            'Else
            '    Response.Redirect("../UserLogon.aspx")
            'End If
            'If Session.Item("CurProjectID") Is Nothing Then ' Check to see if Project is Selected
            '    Response.Redirect("../Private/ProjectSelect.aspx")
            'End If

            cxClass.GetDeficiencies(Session.Item("CurProjectID"), 0, "All", DeficiencyDS)
            txtProjName.Value = Session.Item("CurProjectName")

            InputStatus.Items.Clear()
            InputStatus.Items.Add("Open", "Open")
            InputStatus.Items.Add("Closed", "Closed")
            InputStatus.Items.Add("Pending Verification", "Pending Verification")
            InputStatus.Value = "Open"

            CompanyDS = cxClass.GetCompanies(Session.Item("CurProjectID"), False)
            InputActionBy.DataSource = CompanyDS
            InputActionBy.ValueField = "COMPANY_ID"
            InputActionBy.TextField = "COMPANY_NAME"
            InputActionBy.DataBind()
        End If
        Me.Form.DefaultFocus = "InputTag"
    End Sub

    Protected Sub BTNSaveAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNSaveAdd.Click

        'Take data from each control and add it into the dataset 
        Dim DefCurRow As dsCommissioning.DEFICIENCIESRow
        DefCurRow = DeficiencyDS.NewDEFICIENCIESRow

        ' Check if tag field is empty if so display error and end sub 
        If Not InputTag.Value = Nothing And Not InputTag.Value = String.Empty Then
            DefCurRow.TAG_ID = InputTag.Value
        Else
            PopupControl1.Text = "The Tag field is required, Please enter a Tag for this Issue."
            PopupControl1.ShowOnPageLoad = True
            Exit Sub
        End If
        If Not InputDesc.Value = Nothing And Not InputDesc.Value = String.Empty Then
            DefCurRow.ITEM_DESC = InputDesc.Value
        Else
            PopupControl1.Text = "The description field is required, Please enter a Description for this Issue."
            PopupControl1.ShowOnPageLoad = True
            Exit Sub
        End If

        DefCurRow.PROJECT_ID = Session.Item("CurProjectID")
        DefCurRow.ITEM_STATUS = InputStatus.Value
        DefCurRow.COMPANY_ID = InputActionBy.Value
        DefCurRow.DATE_POSTED = Date.Today
        Dim ItemNo As Integer
        ItemNo = cxClass.GetNextProjectItemID(Session.Item("CurProjectID"))
        DefCurRow.ITEM_NUMBER = ItemNo


        'Update the dataset to the database
        DeficiencyDS.AddDEFICIENCIESRow(DefCurRow)
        cxClass.UpdateDeficiencies(DeficiencyDS)

        '--------- Function to Upload Images intodatabase------------
        Dim PhotoDS As New dsCommissioning.PHOTOSDataTable
        Try
            '            Dim gConnStr As String = "Database=PhotoAlbum;Server=Venus;uid=sa;pwd=projectX2004;" _
            '& "network=dbmssocn;trusted_connection=no"

            'Dim vCommConn As New SqlConnection(gConnStr)
            Dim vPhotoDataAdapter As New SqlDataAdapter

            vPhotoDataAdapter.SelectCommand = New SqlCommand("SELECT * FROM PHOTOS", cxClass.vCommConn)

            vPhotoDataAdapter.InsertCommand = New SqlCommand("INSERT INTO PHOTOS (ID, DESCRIPTION, PROJECT_ID, ITEM_NUMBER, Url) VALUES (@ID, @DESCRIPTION, @PROJECT_ID, @ITEM_NUMBER, @Url)", cxClass.vCommConn)

            vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ID", SqlDbType.NVarChar, 100, "ID"))
            'vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Bytes", SqlDbType.Image, 2147483647, "Bytes"))
            vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@DESCRIPTION", SqlDbType.NVarChar, 100, "DESCRIPTION"))
            vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
            vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_NUMBER", SqlDbType.Int, 4, "ITEM_NUMBER"))
            vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Url", SqlDbType.NVarChar, 500, "Url"))
            'vPhotoDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ContentType", SqlDbType.NVarChar, 500, "ContentType"))



            cxClass.vCommConn.Open()
            If Not PhotoDS Is Nothing Then
                vPhotoDataAdapter.Fill(PhotoDS)

            End If

            Dim vPhotoRow As dsCommissioning.PHOTOSRow
            If Not Session.Item("Image1bytes") Is Nothing Then
                vPhotoRow = PhotoDS.NewPHOTOSRow
                If Not vPhotoRow Is Nothing Then
                    vPhotoRow.Description = PhotoDesc1.Text
                    'vPhotoRow.Bytes = Session.Item("Image1bytes")
                    vPhotoRow.ID = Guid.NewGuid().ToString().Replace("-", "")
                    vPhotoRow.PROJECT_ID = Session.Item("CurProjectID")
                    vPhotoRow.ITEM_NUMBER = ItemNo
                    vPhotoRow.Url = "~/Uploads/" & Session.Item("CurProjectID") & "/" + genId1 + ASPxUploadControl1.UploadedFiles(0).FileName.ToString()
                    PhotoDS.AddPHOTOSRow(vPhotoRow)
                    vPhotoRow = Nothing
                    Session.Remove("Image1bytes")
                End If
            End If

            If Not Session.Item("Image2bytes") Is Nothing Then
                vPhotoRow = PhotoDS.NewPHOTOSRow
                If Not vPhotoRow Is Nothing Then
                    vPhotoRow.Description = PhotoDesc2.Text
                    'vPhotoRow.Bytes = Session.Item("Image2bytes")
                    vPhotoRow.ID = Guid.NewGuid().ToString().Replace("-", "")
                    vPhotoRow.PROJECT_ID = Session.Item("CurProjectID")
                    vPhotoRow.ITEM_NUMBER = ItemNo
                    vPhotoRow.Url = "~/Uploads/" & Session.Item("CurProjectID") & "/" + genId2 + ASPxUploadControl1.UploadedFiles(1).FileName.ToString()
                    PhotoDS.AddPHOTOSRow(vPhotoRow)
                    vPhotoRow = Nothing
                    Session.Remove("Image2bytes")
                End If
            End If

            If Not Session.Item("Image3bytes") Is Nothing Then
                vPhotoRow = PhotoDS.NewPHOTOSRow
                If Not vPhotoRow Is Nothing Then
                    vPhotoRow.Description = PhotoDesc3.Text
                    ' vPhotoRow.Bytes = Session.Item("Image3bytes")
                    vPhotoRow.ID = Guid.NewGuid().ToString().Replace("-", "")
                    vPhotoRow.PROJECT_ID = Session.Item("CurProjectID")
                    vPhotoRow.ITEM_NUMBER = ItemNo
                    vPhotoRow.Url = "~/Uploads/" & Session.Item("CurProjectID") & "/" + genId3 + ASPxUploadControl1.UploadedFiles(2).FileName.ToString()
                    PhotoDS.AddPHOTOSRow(vPhotoRow)
                    vPhotoRow = Nothing
                    Session.Remove("Image3bytes")
                End If
            End If

            vPhotoDataAdapter.Update(PhotoDS)
            cxClass.vCommConn.Close()

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try






        '---------Clear all controls--------------------
        InputTag.Value = Nothing
        InputStatus.Value = Nothing
        InputDesc.Value = Nothing
        InputActionBy.Value = Nothing
        DefCurRow = Nothing
        InputStatus.Value = "Open"
        PhotoDesc1.Value = Nothing
        PhotoDesc2.Value = Nothing
        PhotoDesc3.Value = Nothing

    End Sub

    Protected Sub BTNCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BTNCancel.Click
        Response.Redirect("../Private/IssueLog.aspx")
    End Sub

    Protected Sub ASPxButtonOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButtonOk.Click
        PopupControl1.ShowOnPageLoad = False
    End Sub

    Public Function Resize(ByVal FolderPath As String, ByVal img As Int32) As Boolean
        Dim extension As String = Path.GetExtension(ASPxUploadControl1.UploadedFiles(img).FileName)
        If (extension.ToLower = ".jpeg" Or extension.ToLower = ".jpg" Or extension.ToLower = ".png") Then
            Dim strm As Stream = ASPxUploadControl1.UploadedFiles(img).PostedFile.InputStream
            Using image = System.Drawing.Image.FromStream(strm)

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

                ' New Height of Image in Pixel  
                Dim thumbImg = New System.Drawing.Bitmap(newWidth, newHeight)
                Dim thumbGraph = Graphics.FromImage(thumbImg)
                thumbGraph.CompositingQuality = CompositingQuality.HighQuality
                thumbGraph.SmoothingMode = SmoothingMode.HighQuality
                thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic
                Dim imgRectangle = New Rectangle(0, 0, newWidth, newHeight)
                thumbGraph.DrawImage(image, imgRectangle)
                ' Save the file  
                Dim targetPath As String

                If (img = 0) Then
                    genId1 = MakeUnique()
                    targetPath = FolderPath & Path.GetFileName(genId1 & ASPxUploadControl1.UploadedFiles(img).FileName.ToString())
                    thumbImg.Save(targetPath, image.RawFormat)
                ElseIf (img = 1) Then
                    genId2 = MakeUnique()
                    targetPath = FolderPath & Path.GetFileName(genId2 & ASPxUploadControl1.UploadedFiles(img).FileName.ToString())
                    thumbImg.Save(targetPath, image.RawFormat)
                ElseIf (img = 2) Then
                    genId3 = MakeUnique()
                    targetPath = FolderPath & Path.GetFileName(genId3 & ASPxUploadControl1.UploadedFiles(img).FileName.ToString())
                    thumbImg.Save(targetPath, image.RawFormat)
                End If
                thumbImg.Save(targetPath, image.RawFormat)
                ' Print new Size of file (height or Width)  

                'Show Image  

            End Using

        End If
        Return True
    End Function
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
    Protected Sub ASPxUploadControl1_FilesUploadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxUploadControl1.FilesUploadComplete

        Dim folderPath As String = Server.MapPath("~/Uploads/" & Session.Item("CurProjectID") & "/")
        'url = folderPath
        If Not Directory.Exists(folderPath) Then
            Directory.CreateDirectory(folderPath)
        End If
        If Not ASPxUploadControl1.UploadedFiles(0).FileBytes.Length = 0 Then
            Dim extension As String = Path.GetExtension(ASPxUploadControl1.UploadedFiles(0).FileName)
            If (extension.ToLower = ".jpeg" Or extension.ToLower = ".jpg" Or extension.ToLower = ".png") Then
                Resize(folderPath, 0)
                Session.Add("Image1bytes", ASPxUploadControl1.UploadedFiles(0).FileBytes)
            Else
                genId1 = MakeUnique()
                ASPxUploadControl1.UploadedFiles(0).SaveAs(folderPath & Path.GetFileName(genId1 + ASPxUploadControl1.UploadedFiles(0).FileName))
                Session.Add("Image1bytes", ASPxUploadControl1.UploadedFiles(0).FileBytes)
            End If

        End If
        If Not ASPxUploadControl1.UploadedFiles(1).FileBytes.Length = 0 Then
            Dim extension As String = Path.GetExtension(ASPxUploadControl1.UploadedFiles(1).FileName)
            If (extension.ToLower = ".jpeg" Or extension.ToLower = ".jpg" Or extension.ToLower = ".png") Then
                Resize(folderPath, 1)
                Session.Add("Image2bytes", ASPxUploadControl1.UploadedFiles(1).FileBytes)
            Else
                genId2 = MakeUnique()
                ASPxUploadControl1.UploadedFiles(1).SaveAs(folderPath & Path.GetFileName(genId2 + ASPxUploadControl1.UploadedFiles(1).FileName))
                Session.Add("Image2bytes", ASPxUploadControl1.UploadedFiles(1).FileBytes)
            End If
        End If
        If Not ASPxUploadControl1.UploadedFiles(2).FileBytes.Length = 0 Then
            Dim extension As String = Path.GetExtension(ASPxUploadControl1.UploadedFiles(2).FileName)
            If (extension.ToLower = ".jpeg" Or extension.ToLower = ".jpg" Or extension.ToLower = ".png") Then
                Resize(folderPath, 2)
                Session.Add("Image3bytes", ASPxUploadControl1.UploadedFiles(2).FileBytes)
            Else
                genId3 = MakeUnique()
                ASPxUploadControl1.UploadedFiles(2).SaveAs(folderPath & Path.GetFileName(genId3 + ASPxUploadControl1.UploadedFiles(2).FileName))
                Session.Add("Image3bytes", ASPxUploadControl1.UploadedFiles(2).FileBytes)
            End If
        End If
    End Sub


End Class
