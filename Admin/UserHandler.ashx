<%@ WebHandler Language="VB" Class="UserHandler" %>

Imports System.Web
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Text
Imports System.Collections.Generic
Imports System.Web.Script.Serialization

Public Class UserHandler : Implements IHttpHandler

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim prefixText As String = context.Request.QueryString("term")
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("CommissioningConnectionString").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "Select User_Email from Users where User_Email like @SearchText + '%'"
                cmd.Parameters.AddWithValue("@SearchText", prefixText)
                cmd.Connection = conn
                Dim customers As New List(Of String)()
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(sdr("User_Email").ToString())
                    End While
                End Using
                conn.Close()
                context.Response.Write(New JavaScriptSerializer().Serialize(customers))
            End Using
        End Using

    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class