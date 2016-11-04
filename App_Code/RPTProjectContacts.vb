Public Class RPTProjectContacts
    Inherits DevExpress.XtraReports.UI.XtraReport

#Region " Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private WithEvents ReportHeader As DevExpress.XtraReports.UI.ReportHeaderBand
    Private WithEvents GroupHeader1 As DevExpress.XtraReports.UI.GroupHeaderBand
    Private WithEvents LBLContactTitle As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLProjName As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLProjNum As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLine1 As DevExpress.XtraReports.UI.XRLine
    Protected WithEvents ProjName As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents ProjNum As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLAddress As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents BVHLogo As DevExpress.XtraReports.UI.XRPictureBox
    Protected WithEvents LBLTrade As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLDate As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents LBLPageNum As DevExpress.XtraReports.UI.XRPageInfo
    Protected WithEvents ProjNameFTR As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents TableContacts As DevExpress.XtraReports.UI.XRTable
    Private WithEvents ContactsTableRow1 As DevExpress.XtraReports.UI.XRTableRow
    Private WithEvents CompanyName As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents UserPhone As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents UserEmail As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents UserName As DevExpress.XtraReports.UI.XRTableCell

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resourceFileName As String = "RPTProjectContacts.resx"
        Dim resources As System.Resources.ResourceManager = Global.Resources.RPTProjectContacts.ResourceManager
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand
        Me.TableContacts = New DevExpress.XtraReports.UI.XRTable
        Me.ContactsTableRow1 = New DevExpress.XtraReports.UI.XRTableRow
        Me.UserName = New DevExpress.XtraReports.UI.XRTableCell
        Me.CompanyName = New DevExpress.XtraReports.UI.XRTableCell
        Me.UserPhone = New DevExpress.XtraReports.UI.XRTableCell
        Me.UserEmail = New DevExpress.XtraReports.UI.XRTableCell
        Me.PageFooter = New DevExpress.XtraReports.UI.PageFooterBand
        Me.ProjNameFTR = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLPageNum = New DevExpress.XtraReports.UI.XRPageInfo
        Me.LBLDate = New DevExpress.XtraReports.UI.XRPageInfo
        Me.ReportHeader = New DevExpress.XtraReports.UI.ReportHeaderBand
        Me.BVHLogo = New DevExpress.XtraReports.UI.XRPictureBox
        Me.LBLAddress = New DevExpress.XtraReports.UI.XRLabel
        Me.ProjNum = New DevExpress.XtraReports.UI.XRLabel
        Me.ProjName = New DevExpress.XtraReports.UI.XRLabel
        Me.xrLine1 = New DevExpress.XtraReports.UI.XRLine
        Me.LBLProjNum = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLProjName = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLContactTitle = New DevExpress.XtraReports.UI.XRLabel
        Me.GroupHeader1 = New DevExpress.XtraReports.UI.GroupHeaderBand
        Me.LBLTrade = New DevExpress.XtraReports.UI.XRLabel
        CType(Me.TableContacts, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.TableContacts})
        Me.Detail.Height = 25
        Me.Detail.Name = "Detail"
        Me.Detail.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'TableContacts
        '
        Me.TableContacts.AnchorVertical = CType((DevExpress.XtraReports.UI.VerticalAnchorStyles.Top Or DevExpress.XtraReports.UI.VerticalAnchorStyles.Bottom), DevExpress.XtraReports.UI.VerticalAnchorStyles)
        Me.TableContacts.Font = New System.Drawing.Font("Arial", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TableContacts.Location = New System.Drawing.Point(0, 0)
        Me.TableContacts.Name = "TableContacts"
        Me.TableContacts.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.TableContacts.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.ContactsTableRow1})
        Me.TableContacts.Size = New System.Drawing.Size(750, 25)
        Me.TableContacts.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'ContactsTableRow1
        '
        Me.ContactsTableRow1.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.UserName, Me.CompanyName, Me.UserPhone, Me.UserEmail})
        Me.ContactsTableRow1.Name = "ContactsTableRow1"
        Me.ContactsTableRow1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.ContactsTableRow1.Size = New System.Drawing.Size(750, 25)
        Me.ContactsTableRow1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'UserName
        '
        Me.UserName.CanGrow = False
        Me.UserName.Location = New System.Drawing.Point(0, 0)
        Me.UserName.Name = "UserName"
        Me.UserName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.UserName.Size = New System.Drawing.Size(155, 25)
        Me.UserName.Text = "UserName"
        Me.UserName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'CompanyName
        '
        Me.CompanyName.CanGrow = False
        Me.CompanyName.Location = New System.Drawing.Point(155, 0)
        Me.CompanyName.Name = "CompanyName"
        Me.CompanyName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.CompanyName.Size = New System.Drawing.Size(200, 25)
        Me.CompanyName.Text = "CompanyName"
        Me.CompanyName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'UserPhone
        '
        Me.UserPhone.CanGrow = False
        Me.UserPhone.Location = New System.Drawing.Point(355, 0)
        Me.UserPhone.Name = "UserPhone"
        Me.UserPhone.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.UserPhone.Size = New System.Drawing.Size(110, 25)
        Me.UserPhone.Text = "UserPhone"
        Me.UserPhone.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'UserEmail
        '
        Me.UserEmail.CanGrow = False
        Me.UserEmail.Location = New System.Drawing.Point(465, 0)
        Me.UserEmail.Name = "UserEmail"
        Me.UserEmail.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.UserEmail.Size = New System.Drawing.Size(285, 25)
        Me.UserEmail.Text = "UserEmail"
        Me.UserEmail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'PageFooter
        '
        Me.PageFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.ProjNameFTR, Me.LBLPageNum, Me.LBLDate})
        Me.PageFooter.Height = 18
        Me.PageFooter.Name = "PageFooter"
        Me.PageFooter.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.PageFooter.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'ProjNameFTR
        '
        Me.ProjNameFTR.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProjNameFTR.Location = New System.Drawing.Point(100, 0)
        Me.ProjNameFTR.Name = "ProjNameFTR"
        Me.ProjNameFTR.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ProjNameFTR.Size = New System.Drawing.Size(550, 18)
        Me.ProjNameFTR.Text = "ProjNameFTR"
        Me.ProjNameFTR.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomCenter
        '
        'LBLPageNum
        '
        Me.LBLPageNum.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLPageNum.Format = "Page {0} of {1}"
        Me.LBLPageNum.Location = New System.Drawing.Point(650, 0)
        Me.LBLPageNum.Name = "LBLPageNum"
        Me.LBLPageNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLPageNum.Size = New System.Drawing.Size(100, 18)
        Me.LBLPageNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomRight
        '
        'LBLDate
        '
        Me.LBLDate.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLDate.Format = "{0:MM/dd/yyyy}"
        Me.LBLDate.Location = New System.Drawing.Point(0, 0)
        Me.LBLDate.Name = "LBLDate"
        Me.LBLDate.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLDate.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.LBLDate.Size = New System.Drawing.Size(100, 18)
        Me.LBLDate.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomLeft
        '
        'ReportHeader
        '
        Me.ReportHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.BVHLogo, Me.LBLAddress, Me.ProjNum, Me.ProjName, Me.xrLine1, Me.LBLProjNum, Me.LBLProjName, Me.LBLContactTitle})
        Me.ReportHeader.Height = 154
        Me.ReportHeader.Name = "ReportHeader"
        Me.ReportHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.ReportHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'BVHLogo
        '
        Me.BVHLogo.Image = CType(resources.GetObject("BVHLogo.Image"), System.Drawing.Image)
        Me.BVHLogo.Location = New System.Drawing.Point(675, 0)
        Me.BVHLogo.LockedInUserDesigner = True
        Me.BVHLogo.Name = "BVHLogo"
        Me.BVHLogo.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.BVHLogo.Size = New System.Drawing.Size(74, 150)
        '
        'LBLAddress
        '
        Me.LBLAddress.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLAddress.Location = New System.Drawing.Point(533, 75)
        Me.LBLAddress.Multiline = True
        Me.LBLAddress.Name = "LBLAddress"
        Me.LBLAddress.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLAddress.Size = New System.Drawing.Size(134, 75)
        Me.LBLAddress.Text = "50 Griffin Road South " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Bloomfield, CT  06002" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Tel: (860) 286-9171" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Fax: (860) 24" & _
            "2-0236" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "www.bvhis.com" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        Me.LBLAddress.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'ProjNum
        '
        Me.ProjNum.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProjNum.Location = New System.Drawing.Point(142, 117)
        Me.ProjNum.Name = "ProjNum"
        Me.ProjNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ProjNum.Size = New System.Drawing.Size(383, 25)
        Me.ProjNum.Text = "ProjNum"
        Me.ProjNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'ProjName
        '
        Me.ProjName.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProjName.Location = New System.Drawing.Point(142, 83)
        Me.ProjName.Name = "ProjName"
        Me.ProjName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ProjName.Size = New System.Drawing.Size(383, 25)
        Me.ProjName.Text = "ProjName"
        Me.ProjName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrLine1
        '
        Me.xrLine1.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical
        Me.xrLine1.Location = New System.Drawing.Point(125, 83)
        Me.xrLine1.Name = "xrLine1"
        Me.xrLine1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.xrLine1.Size = New System.Drawing.Size(17, 58)
        '
        'LBLProjNum
        '
        Me.LBLProjNum.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLProjNum.Location = New System.Drawing.Point(8, 117)
        Me.LBLProjNum.Name = "LBLProjNum"
        Me.LBLProjNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLProjNum.Size = New System.Drawing.Size(117, 25)
        Me.LBLProjNum.Text = "Project Number"
        Me.LBLProjNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'LBLProjName
        '
        Me.LBLProjName.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLProjName.Location = New System.Drawing.Point(25, 83)
        Me.LBLProjName.Name = "LBLProjName"
        Me.LBLProjName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLProjName.Size = New System.Drawing.Size(100, 25)
        Me.LBLProjName.Text = "Project Name"
        Me.LBLProjName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'LBLContactTitle
        '
        Me.LBLContactTitle.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLContactTitle.Location = New System.Drawing.Point(0, 25)
        Me.LBLContactTitle.Name = "LBLContactTitle"
        Me.LBLContactTitle.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLContactTitle.Size = New System.Drawing.Size(533, 25)
        Me.LBLContactTitle.Text = "BVH Commissioning Project Contacts"
        Me.LBLContactTitle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'GroupHeader1
        '
        Me.GroupHeader1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.LBLTrade})
        Me.GroupHeader1.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("TRADE_DESC", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader1.Height = 38
        Me.GroupHeader1.Name = "GroupHeader1"
        Me.GroupHeader1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.GroupHeader1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'LBLTrade
        '
        Me.LBLTrade.AnchorVertical = DevExpress.XtraReports.UI.VerticalAnchorStyles.Bottom
        Me.LBLTrade.Borders = DevExpress.XtraPrinting.BorderSide.Bottom
        Me.LBLTrade.CanGrow = False
        Me.LBLTrade.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLTrade.Location = New System.Drawing.Point(0, 10)
        Me.LBLTrade.Name = "LBLTrade"
        Me.LBLTrade.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLTrade.Size = New System.Drawing.Size(750, 26)
        Me.LBLTrade.Text = "Trade"
        Me.LBLTrade.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomLeft
        '
        'RPTProjectContacts
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail, Me.PageFooter, Me.ReportHeader, Me.GroupHeader1})
        Me.Margins = New System.Drawing.Printing.Margins(50, 50, 75, 25)
        Me.Version = "8.3"
        CType(Me.TableContacts, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents PageFooter As DevExpress.XtraReports.UI.PageFooterBand

#End Region

    Protected ProjectsDS As dsCommissioning.PROJECTSDataTable

    Private Function GetResourceManager() As System.Resources.ResourceManager
        Return Resources.RPTProjectContacts.ResourceManager

    End Function

    Private Sub RPTProjectContacts_BeforePrint(ByVal sender As Object, ByVal e As System.Drawing.Printing.PrintEventArgs) Handles Me.BeforePrint
        Try
            ProjectsDS = cxClass.GetProjects(Me.Tag, True, False, 0)
            Dim CurProjectRow As dsCommissioning.PROJECTSRow
            CurProjectRow = ProjectsDS.Rows(0)
            ProjName.Text = CurProjectRow.PROJECT_NAME.ToString
            ProjNameFTR.Text = CurProjectRow.PROJECT_NAME.ToString
            ProjNum.Text = CurProjectRow.PROJECT_NUMBER.ToString

            LBLTrade.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "TRADE_DESC", ""))
            UserName.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "USER_NAME", ""))
            CompanyName.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "COMPANY_NAME", ""))
            UserPhone.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "USER_PHONE", ""))
            UserEmail.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "USER_EMAIL", ""))
            UserEmail.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("NavigateUrl", Me.DataSource, "USER_EMAIL", "mailto:"))
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
    End Sub
End Class