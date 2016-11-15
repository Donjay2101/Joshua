<%@ Application Language="VB" %>
<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        If (Context IsNot Nothing) And (Context.User.IsInRole("Admin")) Then
            Dim err As Exception = Server.GetLastError()

            Response.Clear()
            Response.Write("<h1>" & err.InnerException.Message & "</h1>")
            Response.Write("<pre>" & err.ToString & "</pre>")
            Server.ClearError()
        End If
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub

    Protected Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As System.EventArgs)
        If (Not (HttpContext.Current.User Is Nothing)) Then
            If HttpContext.Current.User.Identity.AuthenticationType = "Forms" Then
                Dim id As System.Web.Security.FormsIdentity
                id = HttpContext.Current.User.Identity

                Dim MyRoles(2) As String
                MyRoles(0) = "User"

                Dim cnn As System.Data.SqlClient.SqlConnection
                Dim cmd As System.Data.SqlClient.SqlCommand
                Dim dr As System.Data.SqlClient.SqlDataReader
                Dim retVal As Boolean = False
                cnn = New System.Data.SqlClient.SqlConnection("Data Source=.;Initial Catalog=cxExample;Integrated Security=true;")

                cmd = New System.Data.SqlClient.SqlCommand("SELECT * FROM USERS WHERE USER_EMAIL = '" & id.Name & "' AND ISACTIVE = 1", cnn)
                cnn.Open()
                dr = cmd.ExecuteReader()
                While (dr.Read())
                    If StrComp(dr.Item("ISADMIN"), "TRUE", 1) = 0 Then
                        MyRoles(1) = "Admin"
                    End If
                End While
                cnn.Close()

                HttpContext.Current.User = New System.Security.Principal.GenericPrincipal(id, MyRoles)
            End If
        End If
    End Sub


</script>