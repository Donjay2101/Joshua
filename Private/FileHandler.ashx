<%@ WebHandler Language="vb" Class="FileHandler" %>

Imports System.Collections
Imports System.Data
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Web
Imports System.Web.Configuration
Imports System.Web.UI
Imports System.Web.UI.WebControls

Public Class FileHandler
    Implements IHttpHandler
    Public Sub ProcessRequest(context As HttpContext) Implements IHttpHandler.ProcessRequest
        If Not String.IsNullOrEmpty(context.Request.Params("id")) Then
            PostImage(context.Request.Params("id"), context)
        End If
    End Sub

    Private Sub PostImage(id As String, context As HttpContext)
        Dim image As String = FindImage(id)
        Dim filePath As String = image
        context.Response.ContentType = "image/jpg"
        context.Response.AddHeader("Content-Disposition", "attachment;filename=""" & filePath & """")
        context.Response.TransmitFile(context.Server.MapPath(filePath))
        context.Response.[End]()
        'WriteBinaryImage(image, context)
    End Sub

    Private Sub WriteBinaryImage(image As Byte(), context As HttpContext)
        Try
            If image IsNot Nothing Then
                context.Response.ContentType = "image/jpeg"
                Using ms As New MemoryStream(image)
                    Using bmp As Bitmap = DirectCast(Bitmap.FromStream(ms), Bitmap)
                        bmp.Save(context.Response.OutputStream, ImageFormat.Jpeg)
                    End Using
                End Using
            Else
                context.Response.ContentType = "image/gif"
            End If
            context.Response.[End]()
        Catch ex As Exception
        End Try
    End Sub

    Private Function FindImage(id As String) As String
        Dim ds As New SqlDataSource(WebConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString, "")
        ds.SelectCommand = "SELECT * FROM [Photos] where id='" & id & "'"
        Dim view As DataView = DirectCast(ds.[Select](DataSourceSelectArguments.Empty), DataView)
        If view.Count > 0 Then
            Return (view(0)(5)).ToString()
        End If
        Return Nothing
    End Function

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
End Class
