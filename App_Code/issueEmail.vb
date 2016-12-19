Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Net
Imports System.Net.Mail
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser
Imports System.Globalization

Public Class issueEmail
    Public Shared Function GetIssueList(ByVal curPoject As String, ByVal curEmail As String) As Boolean

        Dim dt As New DataTable()
        If (curEmail IsNot Nothing) Then
            dt = GetData(True)
            dt.Columns("ITEM_NUMBER").ColumnName = "Number"
            dt.Columns("TAG_ID").ColumnName = "Tag Id"
            dt.Columns("ITEM_DESC").ColumnName = "Description"
            dt.Columns("ITEM_STATUS").ColumnName = "Status"
            dt.Columns("DATE_POSTED").ColumnName = "Posted On"
            dt.Columns("COMPANY_ABB").ColumnName = "Company"
            dt.Columns("ITEM_COMMENT").ColumnName = "Comments"
            SendPDFEmail(curEmail, dt)
        End If
        If (curEmail Is Nothing) Then
            dt = GetData(False)
            For Each row As DataRow In dt.Rows
                dt.Columns("ITEM_NUMBER").ColumnName = "Number"
                dt.Columns("TAG_ID").ColumnName = "Tag Id"
                dt.Columns("ITEM_DESC").ColumnName = "Description"
                dt.Columns("ITEM_STATUS").ColumnName = "Status"
                dt.Columns("DATE_POSTED").ColumnName = "Posted On"
                dt.Columns("COMPANY_ABB").ColumnName = "Company"
                dt.Columns("ITEM_COMMENT").ColumnName = "Comments"
                dt.Columns("User_Email").ColumnName = "Email"
                SendPDFEmail(dt.Rows(0)("Email"), dt)
            Next

        End If
        Return True
    End Function
    Private Shared Sub SendPDFEmail(ByVal curEmail As String, dt As DataTable)
        Using sw As New StringWriter()
            Using hw As New HtmlTextWriter(sw)
                Dim companyName As String = "Demo Company"
                Dim orderNo As Integer = 2303
                Dim sb As New StringBuilder()
                sb.Append("<table width='100%' cellspacing='0' cellpadding='2'>")
                sb.Append("<tr><td align='center' bgcolor='#18B5F0' colspan = '2'><b>Issue Report</b></td></tr>")
                sb.Append("<tr><td colspan = '2'></td></tr>")
                sb.Append("<tr><td><b>Date: </b>")
                sb.Append((DateTime.Now).ToString("MM/dd/yyyy"))
                sb.Append("</td><td><b>Project Name : </b>")
                sb.Append(HttpContext.Current.Session.Item("Prj_Name"))
                sb.Append(" </td></tr>")
                sb.Append("<tr><td colspan><b>Lead CA:</b> ")
                sb.Append(HttpContext.Current.Session("Prj_Lead"))
                sb.Append("</td><td><b>Project Number: </b>")
                sb.Append(HttpContext.Current.Session("Prj_No"))
                sb.Append("</td></tr>")
                sb.Append("</table>")
                sb.Append("<br />")
                sb.Append("<table border = '1'>")
                sb.Append("<tr>")
                For Each column As DataColumn In dt.Columns
                    sb.Append("<th bgcolor='#D20B0C' color='#ffffff'>")
                    sb.Append(column.ColumnName)
                    sb.Append("</th>")
                Next
                sb.Append("</tr>")
                For Each row As DataRow In dt.Rows
                    sb.Append("<tr>")
                    For Each column As DataColumn In dt.Columns
                        sb.Append("<td>")
                        sb.Append(row(column))
                        sb.Append("</td>")
                    Next
                    sb.Append("</tr>")
                Next
                sb.Append("</table>")
                Dim sr As New StringReader(sb.ToString())

                Dim pdfDoc As New Document(PageSize.A4, 20.0F, 20.0F, 20.0F, 20.0F)
                Dim htmlparser As New HTMLWorker(pdfDoc)
                Using memoryStream As New MemoryStream()
                    Dim writer As PdfWriter = PdfWriter.GetInstance(pdfDoc, memoryStream)
                    pdfDoc.Open()
                    htmlparser.Parse(sr)
                    pdfDoc.Close()
                    Dim bytes As Byte() = memoryStream.ToArray()
                    memoryStream.Close()

                    Dim mm As New MailMessage("testeac7@gmail.com", curEmail)
                    mm.Subject = "Issue Report"
                    mm.Body = "Issue Report Attachment"
                    mm.Attachments.Add(New Attachment(New MemoryStream(bytes), "issue_repoer.pdf"))
                    mm.IsBodyHtml = True
                    Dim smtp As New SmtpClient()
                    smtp.Host = "smtp.gmail.com"
                    smtp.EnableSsl = True
                    Dim NetworkCred As New NetworkCredential()
                    NetworkCred.UserName = "testeac7@gmail.com"
                    NetworkCred.Password = "popup$$1234"
                    smtp.UseDefaultCredentials = True
                    smtp.Credentials = NetworkCred
                    smtp.Port = 587
                    smtp.Send(mm)
                End Using
            End Using
        End Using
    End Sub

    Public Shared Function GetData(Optional ByVal para As Boolean = False) As DataTable
        Dim COMPANYID As String
        If HttpContext.Current.Session.Item("FilterString") Like "*COMPANY_ID*" Then
            COMPANYID = HttpContext.Current.Session.Item("FilterString")
            COMPANYID = COMPANYID.Remove(0, COMPANYID.IndexOf("COMPANY_ID"))
            COMPANYID = COMPANYID.Remove(0, 14)
            If COMPANYID.IndexOf("And") > 0 Then
                COMPANYID = COMPANYID.Remove(COMPANYID.IndexOf("And"), (COMPANYID.Length - COMPANYID.IndexOf("And")))
            End If
        Else
            COMPANYID = Nothing
        End If

        'Generate Datasource based on company filter
        If HttpContext.Current.Session.Item("GridSort") = "COMPANY_ID" Then
            HttpContext.Current.Session.Item("GridSort") = "COMPANY_ABB"
        End If
        Dim RPT_DeficiencyDS As dsCommissioning.RPT_DEFICIENCIESDataTable
        RPT_DeficiencyDS = cxClass.GetRPTDeficiencies(HttpContext.Current.Session.Item("CurProjectID"), COMPANYID, "All", HttpContext.Current.Session.Item("GridSort"))

        Dim conString As String = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString
        Dim qryString As String
        qryString = cxClass.GetRPTDeficienciesQuery(HttpContext.Current.Session.Item("CurProjectID"), COMPANYID, "All", HttpContext.Current.Session.Item("GridSort"))
        Dim con As New SqlConnection(conString)
        If para = False Then
            qryString = "SELECT DISTINCT DEFICIENCIES.ITEM_NUMBER, DEFICIENCIES.TAG_ID," &
                            "DEFICIENCIES.ITEM_DESC,  DEFICIENCIES.ITEM_STATUS, DEFICIENCIES.DATE_POSTED, " &
                            "COMPANIES.COMPANY_ABB,  DEFICIENCIES.ITEM_COMMENT, USERS.USER_EMAIL " &
                            "FROM DEFICIENCIES  LEFT OUTER JOIN COMPANIES ON DEFICIENCIES.COMPANY_ID = COMPANIES.COMPANY_ID" &
                            "inner join USERS on COMPANIES.COMPANY_ID=USERS.COMPANY_ID" &
                            "WHERE (DEFICIENCIES.PROJECT_ID = @PROJECT_ID)  ORDER BY ITEM_NUMBER"
        End If

        Using cmd As New SqlCommand(qryString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                cmd.CommandType = CommandType.Text
                cmd.Parameters.AddWithValue("@PROJECT_ID", HttpContext.Current.Session.Item("CurProjectID"))
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Return dt
                End Using
            End Using
        End Using
    End Function
End Class
