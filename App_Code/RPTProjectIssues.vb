
Public Class RPTProjectIssues
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
    Private WithEvents LBLComNoticeTitle As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLNotification As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLDate As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLLeadCA As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents CurDate As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents LeadCA As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLine1 As DevExpress.XtraReports.UI.XRLine
    Private WithEvents LBLProjName As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLProjNum As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents ProjName As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents ProjNum As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLine2 As DevExpress.XtraReports.UI.XRLine
    Private WithEvents LBLActionCode As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents Key As DevExpress.XtraReports.UI.XRLabel
    Protected WithEvents ComNoticeInfoTXT As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents LBLAddress As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents BVHLogo As DevExpress.XtraReports.UI.XRPictureBox
    Private WithEvents LBLCurDate As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents LBLPageNum As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents ProjNameFTR As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents TBLIssueHeader As DevExpress.XtraReports.UI.XRTable
    Private WithEvents TBLRowIssueHeader As DevExpress.XtraReports.UI.XRTableRow
    Private WithEvents No As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents Item As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents Status As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents Response As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents ActionBy As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents ItemTag As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents PostedOn As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents TBLIssues As DevExpress.XtraReports.UI.XRTable
    Protected WithEvents TBLRowIssues As DevExpress.XtraReports.UI.XRTableRow
    Protected WithEvents DataItem As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataActionBy As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataStatus As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataTag As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataPostedOn As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataResponse As DevExpress.XtraReports.UI.XRTableCell
    Protected WithEvents DataNo As DevExpress.XtraReports.UI.XRTableCell

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resourceFileName As String = "RPTProjectIssues.resx"
        Dim resources As System.Resources.ResourceManager = Global.Resources.RPTProjectIssues.ResourceManager
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand
        Me.TBLIssues = New DevExpress.XtraReports.UI.XRTable
        Me.TBLRowIssues = New DevExpress.XtraReports.UI.XRTableRow
        Me.DataNo = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataTag = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataItem = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataPostedOn = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataActionBy = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataStatus = New DevExpress.XtraReports.UI.XRTableCell
        Me.DataResponse = New DevExpress.XtraReports.UI.XRTableCell
        Me.PageHeader = New DevExpress.XtraReports.UI.PageHeaderBand
        Me.TBLIssueHeader = New DevExpress.XtraReports.UI.XRTable
        Me.TBLRowIssueHeader = New DevExpress.XtraReports.UI.XRTableRow
        Me.No = New DevExpress.XtraReports.UI.XRTableCell
        Me.ItemTag = New DevExpress.XtraReports.UI.XRTableCell
        Me.Item = New DevExpress.XtraReports.UI.XRTableCell
        Me.PostedOn = New DevExpress.XtraReports.UI.XRTableCell
        Me.ActionBy = New DevExpress.XtraReports.UI.XRTableCell
        Me.Status = New DevExpress.XtraReports.UI.XRTableCell
        Me.Response = New DevExpress.XtraReports.UI.XRTableCell
        Me.PageFooter = New DevExpress.XtraReports.UI.PageFooterBand
        Me.ProjNameFTR = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLPageNum = New DevExpress.XtraReports.UI.XRPageInfo
        Me.LBLCurDate = New DevExpress.XtraReports.UI.XRPageInfo
        Me.ReportHeader = New DevExpress.XtraReports.UI.ReportHeaderBand
        Me.BVHLogo = New DevExpress.XtraReports.UI.XRPictureBox
        Me.LBLAddress = New DevExpress.XtraReports.UI.XRLabel
        Me.ComNoticeInfoTXT = New DevExpress.XtraReports.UI.XRLabel
        Me.Key = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLActionCode = New DevExpress.XtraReports.UI.XRLabel
        Me.xrLine2 = New DevExpress.XtraReports.UI.XRLine
        Me.ProjNum = New DevExpress.XtraReports.UI.XRLabel
        Me.ProjName = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLProjNum = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLProjName = New DevExpress.XtraReports.UI.XRLabel
        Me.xrLine1 = New DevExpress.XtraReports.UI.XRLine
        Me.LeadCA = New DevExpress.XtraReports.UI.XRLabel
        Me.CurDate = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLLeadCA = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLDate = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLNotification = New DevExpress.XtraReports.UI.XRLabel
        Me.LBLComNoticeTitle = New DevExpress.XtraReports.UI.XRLabel
        CType(Me.TBLIssues, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.TBLIssueHeader, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.TBLIssues})
        Me.Detail.Height = 25
        Me.Detail.Name = "Detail"
        Me.Detail.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'TBLIssues
        '
        Me.TBLIssues.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TBLIssues.Location = New System.Drawing.Point(0, 0)
        Me.TBLIssues.Name = "TBLIssues"
        Me.TBLIssues.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 96.0!)
        Me.TBLIssues.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.TBLRowIssues})
        Me.TBLIssues.Size = New System.Drawing.Size(1000, 25)
        Me.TBLIssues.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'TBLRowIssues
        '
        Me.TBLRowIssues.Borders = CType((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.TBLRowIssues.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.DataNo, Me.DataTag, Me.DataItem, Me.DataPostedOn, Me.DataActionBy, Me.DataStatus, Me.DataResponse})
        Me.TBLRowIssues.Name = "TBLRowIssues"
        Me.TBLRowIssues.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 96.0!)
        Me.TBLRowIssues.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        Me.TBLRowIssues.Weight = 1
        '
        'DataNo
        '
        Me.DataNo.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataNo.Name = "DataNo"
        Me.DataNo.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataNo.Text = "DataNo"
        Me.DataNo.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        Me.DataNo.Weight = 0.06
        '
        'DataTag
        '
        Me.DataTag.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataTag.Name = "DataTag"
        Me.DataTag.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataTag.Text = "DataTag"
        Me.DataTag.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        Me.DataTag.Weight = 0.08
        '
        'DataItem
        '
        Me.DataItem.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataItem.Multiline = True
        Me.DataItem.Name = "DataItem"
        Me.DataItem.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataItem.Text = "DataItem"
        Me.DataItem.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        Me.DataItem.Weight = 0.29
        '
        'DataPostedOn
        '
        Me.DataPostedOn.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataPostedOn.Name = "DataPostedOn"
        Me.DataPostedOn.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataPostedOn.Text = "DataPostedOn"
        Me.DataPostedOn.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        Me.DataPostedOn.Weight = 0.1
        '
        'DataActionBy
        '
        Me.DataActionBy.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataActionBy.Name = "DataActionBy"
        Me.DataActionBy.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataActionBy.Text = "DataActionBy"
        Me.DataActionBy.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        Me.DataActionBy.Weight = 0.08
        '
        'DataStatus
        '
        Me.DataStatus.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataStatus.Name = "DataStatus"
        Me.DataStatus.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataStatus.Text = "DataStatus"
        Me.DataStatus.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        Me.DataStatus.Weight = 0.08
        '
        'DataResponse
        '
        Me.DataResponse.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Right) _
                    Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.DataResponse.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DataResponse.Multiline = True
        Me.DataResponse.Name = "DataResponse"
        Me.DataResponse.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.DataResponse.Text = "DataResponse"
        Me.DataResponse.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        Me.DataResponse.Weight = 0.31
        '
        'PageHeader
        '
        Me.PageHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.TBLIssueHeader})
        Me.PageHeader.Height = 30
        Me.PageHeader.Name = "PageHeader"
        Me.PageHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.PageHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'TBLIssueHeader
        '
        Me.TBLIssueHeader.AnchorVertical = CType((DevExpress.XtraReports.UI.VerticalAnchorStyles.Top Or DevExpress.XtraReports.UI.VerticalAnchorStyles.Bottom), DevExpress.XtraReports.UI.VerticalAnchorStyles)
        Me.TBLIssueHeader.BackColor = System.Drawing.Color.Black
        Me.TBLIssueHeader.BorderColor = System.Drawing.Color.White
        Me.TBLIssueHeader.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.TBLIssueHeader.ForeColor = System.Drawing.Color.White
        Me.TBLIssueHeader.Location = New System.Drawing.Point(0, 0)
        Me.TBLIssueHeader.Name = "TBLIssueHeader"
        Me.TBLIssueHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 96.0!)
        Me.TBLIssueHeader.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.TBLRowIssueHeader})
        Me.TBLIssueHeader.Size = New System.Drawing.Size(1000, 30)
        Me.TBLIssueHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'TBLRowIssueHeader
        '
        Me.TBLRowIssueHeader.Borders = DevExpress.XtraPrinting.BorderSide.Left
        Me.TBLRowIssueHeader.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.No, Me.ItemTag, Me.Item, Me.PostedOn, Me.ActionBy, Me.Status, Me.Response})
        Me.TBLRowIssueHeader.Name = "TBLRowIssueHeader"
        Me.TBLRowIssueHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 96.0!)
        Me.TBLRowIssueHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.TBLRowIssueHeader.Weight = 1
        '
        'No
        '
        Me.No.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.No.CanGrow = False
        Me.No.Name = "No"
        Me.No.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.No.Text = "No."
        Me.No.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.No.Weight = 0.06
        '
        'ItemTag
        '
        Me.ItemTag.CanGrow = False
        Me.ItemTag.Name = "ItemTag"
        Me.ItemTag.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ItemTag.Text = "Tag"
        Me.ItemTag.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.ItemTag.Weight = 0.08
        '
        'Item
        '
        Me.Item.CanGrow = False
        Me.Item.Name = "Item"
        Me.Item.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.Item.Text = "Item"
        Me.Item.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.Item.Weight = 0.29
        '
        'PostedOn
        '
        Me.PostedOn.CanGrow = False
        Me.PostedOn.Name = "PostedOn"
        Me.PostedOn.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.PostedOn.Text = "Posted On"
        Me.PostedOn.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.PostedOn.Weight = 0.1
        '
        'ActionBy
        '
        Me.ActionBy.CanGrow = False
        Me.ActionBy.Name = "ActionBy"
        Me.ActionBy.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ActionBy.Text = "Action By"
        Me.ActionBy.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.ActionBy.Weight = 0.08
        '
        'Status
        '
        Me.Status.CanGrow = False
        Me.Status.Name = "Status"
        Me.Status.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.Status.Text = "Status"
        Me.Status.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.Status.Weight = 0.08
        '
        'Response
        '
        Me.Response.CanGrow = False
        Me.Response.Name = "Response"
        Me.Response.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.Response.Text = "Response"
        Me.Response.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        Me.Response.Weight = 0.31
        '
        'PageFooter
        '
        Me.PageFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.ProjNameFTR, Me.LBLPageNum, Me.LBLCurDate})
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
        Me.ProjNameFTR.Size = New System.Drawing.Size(800, 18)
        Me.ProjNameFTR.Text = "ProjNameFTR"
        Me.ProjNameFTR.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomCenter
        '
        'LBLPageNum
        '
        Me.LBLPageNum.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLPageNum.Format = "Page {0} of {1}"
        Me.LBLPageNum.Location = New System.Drawing.Point(900, 0)
        Me.LBLPageNum.Name = "LBLPageNum"
        Me.LBLPageNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLPageNum.Size = New System.Drawing.Size(100, 18)
        Me.LBLPageNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomRight
        '
        'LBLCurDate
        '
        Me.LBLCurDate.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLCurDate.Format = "{0:MM/dd/yyyy}"
        Me.LBLCurDate.Location = New System.Drawing.Point(0, 0)
        Me.LBLCurDate.Name = "LBLCurDate"
        Me.LBLCurDate.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLCurDate.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.LBLCurDate.Size = New System.Drawing.Size(100, 18)
        Me.LBLCurDate.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomLeft
        '
        'ReportHeader
        '
        Me.ReportHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.BVHLogo, Me.LBLAddress, Me.ComNoticeInfoTXT, Me.Key, Me.LBLActionCode, Me.xrLine2, Me.ProjNum, Me.ProjName, Me.LBLProjNum, Me.LBLProjName, Me.xrLine1, Me.LeadCA, Me.CurDate, Me.LBLLeadCA, Me.LBLDate, Me.LBLNotification, Me.LBLComNoticeTitle})
        Me.ReportHeader.Height = 360
        Me.ReportHeader.Name = "ReportHeader"
        Me.ReportHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.ReportHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'BVHLogo
        '
        Me.BVHLogo.Image = CType(resources.GetObject("BVHLogo.Image"), System.Drawing.Image)
        Me.BVHLogo.Location = New System.Drawing.Point(925, 0)
        Me.BVHLogo.LockedInUserDesigner = True
        Me.BVHLogo.Name = "BVHLogo"
        Me.BVHLogo.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.BVHLogo.Size = New System.Drawing.Size(74, 150)
        '
        'LBLAddress
        '
        Me.LBLAddress.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLAddress.Location = New System.Drawing.Point(783, 75)
        Me.LBLAddress.Multiline = True
        Me.LBLAddress.Name = "LBLAddress"
        Me.LBLAddress.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLAddress.Size = New System.Drawing.Size(134, 75)
        Me.LBLAddress.Text = "50 Griffin Road South " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Bloomfield, CT  06002" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Tel: (860) 286-9171" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "Fax: (860) 24" & _
            "2-0236" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "www.bvhis.com" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10)
        Me.LBLAddress.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'ComNoticeInfoTXT
        '
        Me.ComNoticeInfoTXT.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ComNoticeInfoTXT.Location = New System.Drawing.Point(0, 258)
        Me.ComNoticeInfoTXT.Multiline = True
        Me.ComNoticeInfoTXT.Name = "ComNoticeInfoTXT"
        Me.ComNoticeInfoTXT.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ComNoticeInfoTXT.Size = New System.Drawing.Size(1000, 50)
        Me.ComNoticeInfoTXT.Text = resources.GetString("ComNoticeInfoTXT.Text")
        Me.ComNoticeInfoTXT.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'Key
        '
        Me.Key.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Key.Location = New System.Drawing.Point(100, 317)
        Me.Key.Name = "Key"
        Me.Key.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.Key.Size = New System.Drawing.Size(900, 35)
        Me.Key.Text = "Key"
        Me.Key.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'LBLActionCode
        '
        Me.LBLActionCode.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLActionCode.Location = New System.Drawing.Point(0, 317)
        Me.LBLActionCode.Name = "LBLActionCode"
        Me.LBLActionCode.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLActionCode.Size = New System.Drawing.Size(100, 25)
        Me.LBLActionCode.Text = "Action Code:"
        Me.LBLActionCode.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'xrLine2
        '
        Me.xrLine2.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical
        Me.xrLine2.Location = New System.Drawing.Point(458, 192)
        Me.xrLine2.Name = "xrLine2"
        Me.xrLine2.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.xrLine2.Size = New System.Drawing.Size(17, 58)
        '
        'ProjNum
        '
        Me.ProjNum.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProjNum.Location = New System.Drawing.Point(475, 225)
        Me.ProjNum.Name = "ProjNum"
        Me.ProjNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ProjNum.Size = New System.Drawing.Size(310, 25)
        Me.ProjNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'ProjName
        '
        Me.ProjName.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ProjName.Location = New System.Drawing.Point(475, 192)
        Me.ProjName.Name = "ProjName"
        Me.ProjName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.ProjName.Size = New System.Drawing.Size(310, 25)
        Me.ProjName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'LBLProjNum
        '
        Me.LBLProjNum.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLProjNum.Location = New System.Drawing.Point(341, 225)
        Me.LBLProjNum.Name = "LBLProjNum"
        Me.LBLProjNum.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLProjNum.Size = New System.Drawing.Size(117, 25)
        Me.LBLProjNum.Text = "Project Number"
        Me.LBLProjNum.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'LBLProjName
        '
        Me.LBLProjName.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLProjName.Location = New System.Drawing.Point(358, 192)
        Me.LBLProjName.Name = "LBLProjName"
        Me.LBLProjName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLProjName.Size = New System.Drawing.Size(100, 25)
        Me.LBLProjName.Text = "Project Name"
        Me.LBLProjName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'xrLine1
        '
        Me.xrLine1.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical
        Me.xrLine1.Location = New System.Drawing.Point(100, 192)
        Me.xrLine1.Name = "xrLine1"
        Me.xrLine1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.xrLine1.Size = New System.Drawing.Size(17, 58)
        '
        'LeadCA
        '
        Me.LeadCA.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LeadCA.Location = New System.Drawing.Point(117, 225)
        Me.LeadCA.Name = "LeadCA"
        Me.LeadCA.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LeadCA.Size = New System.Drawing.Size(200, 25)
        Me.LeadCA.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'CurDate
        '
        Me.CurDate.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.CurDate.Location = New System.Drawing.Point(117, 192)
        Me.CurDate.Name = "CurDate"
        Me.CurDate.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.CurDate.Size = New System.Drawing.Size(200, 25)
        Me.CurDate.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'LBLLeadCA
        '
        Me.LBLLeadCA.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLLeadCA.Location = New System.Drawing.Point(25, 225)
        Me.LBLLeadCA.Name = "LBLLeadCA"
        Me.LBLLeadCA.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLLeadCA.Size = New System.Drawing.Size(75, 25)
        Me.LBLLeadCA.Text = "Lead CA"
        Me.LBLLeadCA.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'LBLDate
        '
        Me.LBLDate.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLDate.Location = New System.Drawing.Point(25, 192)
        Me.LBLDate.Name = "LBLDate"
        Me.LBLDate.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLDate.Size = New System.Drawing.Size(75, 25)
        Me.LBLDate.Text = "Date"
        Me.LBLDate.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'LBLNotification
        '
        Me.LBLNotification.Font = New System.Drawing.Font("Arial", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLNotification.Location = New System.Drawing.Point(0, 158)
        Me.LBLNotification.Name = "LBLNotification"
        Me.LBLNotification.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLNotification.Size = New System.Drawing.Size(383, 25)
        Me.LBLNotification.Text = "Notification of Items Requiring Correction"
        Me.LBLNotification.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'LBLComNoticeTitle
        '
        Me.LBLComNoticeTitle.Font = New System.Drawing.Font("Arial", 18.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LBLComNoticeTitle.Location = New System.Drawing.Point(0, 42)
        Me.LBLComNoticeTitle.Name = "LBLComNoticeTitle"
        Me.LBLComNoticeTitle.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.LBLComNoticeTitle.Size = New System.Drawing.Size(350, 25)
        Me.LBLComNoticeTitle.Text = "BVH Commissioning Notice"
        Me.LBLComNoticeTitle.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'RPTProjectIssues
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail, Me.PageHeader, Me.PageFooter, Me.ReportHeader})
        Me.Font = New System.Drawing.Font("Arial", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Landscape = True
        Me.Margins = New System.Drawing.Printing.Margins(50, 50, 50, 25)
        Me.PageHeight = 850
        Me.PageWidth = 1100
        Me.Version = "9.2"
        CType(Me.TBLIssues, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.TBLIssueHeader, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents PageHeader As DevExpress.XtraReports.UI.PageHeaderBand
    Friend WithEvents PageFooter As DevExpress.XtraReports.UI.PageFooterBand

#End Region
    Protected CompanyDS As dsCommissioning.COMPANIESDataTable
    Protected ProjectsDS As dsCommissioning.PROJECTSDataTable

    Private Function GetResourceManager() As System.Resources.ResourceManager
        Return Resources.RPTProjectIssues.ResourceManager

    End Function

    Private Sub RPTProjectIssues_BeforePrint(ByVal sender As Object, ByVal e As System.Drawing.Printing.PrintEventArgs) Handles Me.BeforePrint
        DataNo.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "ITEM_NUMBER", ""))
        DataTag.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "TAG_ID", ""))
        DataItem.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "ITEM_DESC", ""))
        DataPostedOn.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "DATE_POSTED", "{0:yyyy/MM/dd}"))
        DataActionBy.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "COMPANY_ABB", ""))
        DataStatus.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "ITEM_STATUS", ""))
        DataResponse.DataBindings.Add(New DevExpress.XtraReports.UI.XRBinding("Text", Me.DataSource, "ITEM_COMMENT", ""))

        'Me.FilterString = "[ITEM_STATUS] = 'Open'"

        Try
            ProjectsDS = cxClass.GetProjects(Me.Tag, True, False, 0)
            Dim CurProjectRow As dsCommissioning.PROJECTSRow
            CurProjectRow = ProjectsDS.Rows(0)
            ProjName.Text = CurProjectRow.PROJECT_NAME.ToString
            ProjNameFTR.Text = CurProjectRow.PROJECT_NAME.ToString
            ProjNum.Text = CurProjectRow.PROJECT_NUMBER.ToString
            If Not CurProjectRow.IsPROJECT_LEED_CANull Then
                LeadCA.Text = CurProjectRow.PROJECT_LEED_CA.ToString
            End If
            If Not CurProjectRow.IsPROJECT_COMNOTICE_INFONull Then
                ComNoticeInfoTXT.Text = CurProjectRow.PROJECT_COMNOTICE_INFO.ToString
            End If
            CurDate.Text = Date.Today.ToLongDateString

            CompanyDS = cxClass.GetCompanies(Me.Tag, False)
            Dim CompanyKey As String = ""
            Dim CompanyCurRow As dsCommissioning.COMPANIESRow
            For Each CompanyCurRow In CompanyDS
                CompanyKey &= CompanyCurRow.COMPANY_ABB.ToString & " - " & CompanyCurRow.COMPANY_NAME.ToString & ",  "
            Next
            Key.Text = CompanyKey
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try
    End Sub
End Class