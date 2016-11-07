Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.data

Public Class cxClass
    Inherits System.ComponentModel.Component

    Public Shared gConnStr As String = "Database=cxExample;Server=.;Integrated Security=true"

    Public Shared vCommConn As New SqlConnection(gConnStr)
    Public Shared ImageHolder As String

    Public Shared Report As DevExpress.XtraReports.UI.XtraReport

    Public Shared Function GetDeficiencies(ByVal pCurProj As Integer, ByVal pCurTrade As Integer, ByVal pStatus As String, ByVal pDSDeficiencies As dsCommissioning.DEFICIENCIESDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical, "cxPortal")
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String

        vSQL = "SELECT DISTINCT DEFICIENCIES.ITEM_NUMBER, DEFICIENCIES.TAG_ID, DEFICIENCIES.ITEM_DESC, "
        vSQL &= " DEFICIENCIES.ITEM_STATUS, DEFICIENCIES.DATE_POSTED, DEFICIENCIES.COMPANY_ID, "
        vSQL &= " DEFICIENCIES.ITEM_COMMENT, DEFICIENCIES.PROJECT_ID "

        vSQL &= " FROM DEFICIENCIES "
        If Not pCurTrade = 0 Then
            vSQL &= " INNER JOIN COMPANIES ON DEFICIENCIES.COMPANY_ID = COMPANIES.COMPANY_ID "
            vSQL &= " INNER JOIN USERS ON COMPANIES.COMPANY_ID = USERS.COMPANY_ID "
            vSQL &= " INNER JOIN USER_ROLES ON USERS.USER_ID = USER_ROLES.USER_ID "
        End If

        vSQL &= " WHERE (DEFICIENCIES.PROJECT_ID = @PROJECT_ID)"
        If Not pCurTrade = 0 Then
            vSQL &= " AND (USER_ROLES.TRADE_ID = @TRADE_ID)"
            vSQL &= " AND (USER_ROLES.PROJECT_ID = @PROJECT_ID)"
        End If
        If Not pStatus = "All" Then
            If pStatus = "Both" Then
                vSQL &= " AND (DEFICIENCIES.ITEM_STATUS = 'Open' OR DEFICIENCIES.ITEM_STATUS = 'Pending Verification')"
            Else
                vSQL &= " AND (DEFICIENCIES.ITEM_STATUS = @ITEM_STATUS)"
            End If
        End If
        vSQL &= " ORDER BY DEFICIENCIES.ITEM_NUMBER"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)

        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        If Not pCurTrade = 0 Then
            vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@TRADE_ID", SqlDbType.Int, 4)
            vDeficienciesDataAdapter.SelectCommand.Parameters("@TRADE_ID").Value = pCurTrade
        End If
        If Not pStatus = "All" And Not pStatus = "Both" Then
            vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
            vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = pStatus
        End If

        vDeficienciesDataAdapter.Fill(pDSDeficiencies)
        vCommConn.Close()
        Return True
    End Function
    Public Shared Function UpdateDeficiencies(ByVal pDeficienciesDS As dsCommissioning.DEFICIENCIESDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vDeficienciesDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO DEFICIENCIES (PROJECT_ID, ITEM_STATUS, ITEM_NUMBER," _
        & " TAG_ID, ITEM_DESC, DATE_POSTED, COMPANY_ID, ITEM_COMMENT)" _
        & " VALUES (@PROJECT_ID, @ITEM_STATUS, @ITEM_NUMBER, @TAG_ID, @ITEM_DESC," _
        & " @DATE_POSTED, @COMPANY_ID, @ITEM_COMMENT);" _
        & " SELECT *" _
        & " FROM DEFICIENCIES" _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND" _
        & " (ITEM_NUMBER = @ITEM_NUMBER)", vCommConn)

        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_STATUS", SqlDbType.NVarChar, 32, "ITEM_STATUS"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_NUMBER", SqlDbType.Int, 4, "ITEM_NUMBER"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TAG_ID", SqlDbType.NVarChar, 48, "TAG_ID"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_DESC", SqlDbType.NVarChar, 2048, "ITEM_DESC"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@DATE_POSTED", SqlDbType.DateTime, 8, "DATE_POSTED"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.Int, 4, "COMPANY_ID"))
        vDeficienciesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_COMMENT", SqlDbType.NVarChar, 4000, "ITEM_COMMENT"))

        '--- Update Command ---
        vDeficienciesDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE DEFICIENCIES" _
        & " SET ITEM_STATUS = @ITEM_STATUS, TAG_ID = @TAG_ID," _
        & " ITEM_DESC = @ITEM_DESC, ITEM_COMMENT = @ITEM_COMMENT," _
        & " COMPANY_ID = @COMPANY_ID" _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND" _
        & " (ITEM_NUMBER = @ITEM_NUMBER);" _
        & " SELECT *" _
        & " FROM DEFICIENCIES" _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND" _
        & " (ITEM_NUMBER = @ITEM_NUMBER)", vCommConn)


        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_STATUS", SqlDbType.NVarChar, 32, "ITEM_STATUS"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_NUMBER", SqlDbType.Int, 4, "ITEM_NUMBER"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TAG_ID", SqlDbType.NVarChar, 48, "TAG_ID"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_DESC", SqlDbType.NVarChar, 2048, "ITEM_DESC"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.Int, 4, "COMPANY_ID"))
        vDeficienciesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_COMMENT", SqlDbType.NVarChar, 4000, "ITEM_COMMENT"))

        '--- Delete Command ---
        vDeficienciesDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM DEFICIENCIES" _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND" _
        & " (ITEM_NUMBER = @ITEM_NUMBER)", vCommConn)

        vDeficienciesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vDeficienciesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ITEM_NUMBER", SqlDbType.Int, 4, "ITEM_NUMBER"))

        vDeficienciesDataAdapter.Update(pDeficienciesDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetNextProjectItemID(ByVal ProjectID As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim dbcmd As New SqlCommand("GetNextProjectItemID", vCommConn)
        Dim CurrentParm As SqlParameter

        dbcmd.CommandType = CommandType.StoredProcedure

        CurrentParm = dbcmd.Parameters.Add("@project_id", SqlDbType.Int)
        CurrentParm.Value = ProjectID

        CurrentParm = dbcmd.Parameters.Add("@next_item_number", SqlDbType.Int)
        CurrentParm.Direction = ParameterDirection.Output

        dbcmd.ExecuteNonQuery()
        vCommConn.Close()
        Return CurrentParm.Value
    End Function

    Public Shared Function GetProjects(ByVal pCurProj As Integer, ByVal pIsUserAdmin As Boolean, ByVal pGetClosed As Boolean, ByVal pCurUserID As Integer) As dsCommissioning.PROJECTSDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vProjectsDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        'vSQL &= "SELECT DISTINCT *"
        'vSQL &= "FROM PROJECTS "
        vSQL = "SELECT DISTINCT PROJECTS.PROJECT_ID, PROJECTS.PROJECT_NUMBER, PROJECTS.PROJECT_DESC, "
        vSQL &= " PROJECTS.PROJECT_LOC, PROJECTS.PROJECT_NAME, PROJECTS.PROJECT_OWNER, "
        vSQL &= " PROJECTS.PROJECT_LEED_CA, PROJECTS.PROJECT_LEED_EMAIL, PROJECTS.PROJECT_CLOSED, "
        vSQL &= " PROJECTS.PROJECT_COMNOTICE_INFO"
        vSQL &= " FROM PROJECTS "
        If pCurProj = 0 And pIsUserAdmin = True Then
            vSQL &= " "
            If pGetClosed = False Then
                vSQL &= "WHERE (PROJECT_CLOSED = @PROJECT_CLOSED) "
            End If
        ElseIf pCurProj = 0 Then
            vSQL &= "INNER JOIN USER_ROLES ON USER_ROLES.PROJECT_ID = PROJECTS.PROJECT_ID "
            If pGetClosed = False Then
                vSQL &= "WHERE (PROJECT_CLOSED = @PROJECT_CLOSED) AND "
            Else
                vSQL &= "WHERE "
            End If
            vSQL &= " (USER_ROLES.USER_ID = @USER_ID)"
        Else
            vSQL &= "WHERE (PROJECT_ID = @PROJECT_ID) "
            If pGetClosed = False Then
                vSQL &= "AND (PROJECT_CLOSED = @PROJECT_CLOSED) "
            End If
        End If
        vSQL &= " ORDER BY PROJECTS.PROJECT_NAME"

        vProjectsDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)

        If Not pCurProj = 0 Then
            vProjectsDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
            vProjectsDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        End If
        If pGetClosed = False Then
            vProjectsDataAdapter.SelectCommand.Parameters.Add("@PROJECT_CLOSED", SqlDbType.Bit, 1)
            vProjectsDataAdapter.SelectCommand.Parameters("@PROJECT_CLOSED").Value = False
        End If
        If pCurProj = 0 And pIsUserAdmin = False Then
            vProjectsDataAdapter.SelectCommand.Parameters.Add("@USER_ID", SqlDbType.Int, 4)
            vProjectsDataAdapter.SelectCommand.Parameters("@USER_ID").Value = pCurUserID
        End If

        Dim vPROJECTDataSet As New dsCommissioning

        vProjectsDataAdapter.Fill(vPROJECTDataSet.PROJECTS)
        vCommConn.Close()
        Return vPROJECTDataSet.PROJECTS
    End Function
    Public Shared Function UpdateProjects(ByVal pProjectDS As dsCommissioning.PROJECTSDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vProjectsDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vProjectsDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO PROJECTS (PROJECT_NUMBER, PROJECT_DESC, PROJECT_LOC, " _
        & " PROJECT_NAME, PROJECT_OWNER, PROJECT_LEED_CA, PROJECT_LEED_EMAIL, PROJECT_CLOSED, PROJECT_COMNOTICE_INFO)" _
        & " VALUES (@PROJECT_NUMBER, @PROJECT_DESC, @PROJECT_LOC, @PROJECT_NAME, @PROJECT_OWNER," _
        & " @PROJECT_LEED_CA, @PROJECT_LEED_EMAIL, @PROJECT_CLOSED, @PROJECT_COMNOTICE_INFO);" _
        & " SELECT *" _
        & " FROM PROJECTS" _
        & " WHERE (PROJECT_ID = @PROJECT_ID)", vCommConn)

        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_NUMBER", SqlDbType.NVarChar, 16, "PROJECT_NUMBER"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_DESC", SqlDbType.NVarChar, 512, "PROJECT_DESC"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LOC", SqlDbType.NVarChar, 50, "PROJECT_LOC"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_NAME", SqlDbType.NVarChar, 50, "PROJECT_NAME"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_OWNER", SqlDbType.NVarChar, 50, "PROJECT_OWNER"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LEED_CA", SqlDbType.NVarChar, 50, "PROJECT_LEED_CA"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LEED_EMAIL", SqlDbType.NVarChar, 50, "PROJECT_LEED_EMAIL"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_CLOSED", SqlDbType.Bit, 1, "PROJECT_CLOSED"))
        vProjectsDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_COMNOTICE_INFO", SqlDbType.NVarChar, 1024, "PROJECT_COMNOTICE_INFO"))


        '--- Update Command ---
        vProjectsDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE PROJECTS" _
        & " SET PROJECT_NUMBER = @PROJECT_NUMBER, PROJECT_DESC = @PROJECT_DESC," _
        & " PROJECT_LOC = @PROJECT_LOC, PROJECT_NAME = @PROJECT_NAME," _
        & " PROJECT_OWNER = @PROJECT_OWNER, PROJECT_LEED_CA = @PROJECT_LEED_CA," _
        & " PROJECT_LEED_EMAIL = @PROJECT_LEED_EMAIL, PROJECT_CLOSED = @PROJECT_CLOSED, PROJECT_COMNOTICE_INFO = @PROJECT_COMNOTICE_INFO" _
        & " WHERE (PROJECT_ID = @PROJECT_ID);" _
        & " SELECT *" _
        & " FROM PROJECTS" _
        & " WHERE (PROJECT_ID = @PROJECT_ID)", vCommConn)

        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_NUMBER", SqlDbType.NVarChar, 16, "PROJECT_NUMBER"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_DESC", SqlDbType.NVarChar, 512, "PROJECT_DESC"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LOC", SqlDbType.NVarChar, 50, "PROJECT_LOC"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_NAME", SqlDbType.NVarChar, 50, "PROJECT_NAME"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_OWNER", SqlDbType.NVarChar, 50, "PROJECT_OWNER"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LEED_CA", SqlDbType.NVarChar, 50, "PROJECT_LEED_CA"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_LEED_EMAIL", SqlDbType.NVarChar, 50, "PROJECT_LEED_EMAIL"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_CLOSED", SqlDbType.Bit, 1, "PROJECT_CLOSED"))
        vProjectsDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_COMNOTICE_INFO", SqlDbType.NVarChar, 1024, "PROJECT_COMNOTICE_INFO"))


        '--- Delete Command ---
        vProjectsDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM PROJECTS" _
        & " WHERE (PROJECT_ID = @PROJECT_ID)", vCommConn)

        vProjectsDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))

        vProjectsDataAdapter.Update(pProjectDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetUser_Roles(ByVal pCurProj As Integer, ByVal pUser_RolesDS As dsCommissioning.USER_ROLESDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUser_RolesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM USER_ROLES "
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "

        vUser_RolesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vUser_RolesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj

        vUser_RolesDataAdapter.Fill(pUser_RolesDS)
        vCommConn.Close()
        Return True
    End Function
    Public Shared Function UpdateUser_Roles(ByVal pUser_RolesDS As dsCommissioning.USER_ROLESDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUser_RolesDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vUser_RolesDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO USER_ROLES (PROJECT_ID, USER_ID, TRADE_ID)" _
        & " VALUES (@PROJECT_ID, @USER_ID, @TRADE_ID);" _
        & " SELECT *" _
        & " FROM USER_ROLES" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND TRADE_ID = @TRADE_ID)", vCommConn)

        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TRADE_ID", SqlDbType.Int, 4, "TRADE_ID"))

        '--- Update Command ---
        'vUser_RolesDataAdapter.UpdateCommand = New SqlCommand("" _
        '& "UPDATE USER_ROLES" _
        '& " SET PROJECT_ID = @PROJECT_ID, USER_ID = @USER_ID," _
        '& " TRADE_ID = @TRADE_ID" _
        '& " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND TRADE_ID = @TRADE_ID);" _
        '& " SELECT *" _
        '& " FROM USER_ROLES" _
        '& " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND TRADE_ID = @TRADE_ID)", vCommConn)

        'vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        'vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        'vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TRADE_ID", SqlDbType.Int, 4, "TRADE_ID"))

        vUser_RolesDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE USER_ROLES" _
        & " SET PROJECT_ID = @PROJECT_ID, USER_ID = @USER_ID, TRADE_ID = @TRADE_ID " _
        & " WHERE (PROJECT_ID = @Original_PROJECT_ID) AND (TRADE_ID = @Original_TRADE_ID) AND (USER_ID = @Original_USER_ID); " _
        & " SELECT PROJECT_ID, USER_ID, TRADE_ID " _
        & " FROM USER_ROLES " _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND (TRADE_ID = @TRADE_ID) AND (USER_ID = @USER_ID)", vCommConn)

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", System.Data.SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", System.Data.SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TRADE_ID", System.Data.SqlDbType.Int, 4, "TRADE_ID"))

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PROJECT_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PROJECT_ID", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_TRADE_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "TRADE_ID", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_USER_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "USER_ID", System.Data.DataRowVersion.Original, Nothing))

        '--- Delete Command ---
        vUser_RolesDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM USER_ROLES" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND TRADE_ID = @TRADE_ID)", vCommConn)

        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@TRADE_ID", SqlDbType.Int, 4, "TRADE_ID"))

        vUser_RolesDataAdapter.Update(pUser_RolesDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetCompanies(ByVal pCurProj As Integer, ByVal pShowActiveOnly As Boolean) As dsCommissioning.COMPANIESDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vCompaniesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT DISTINCT COMPANIES.COMPANY_ID, COMPANIES.COMPANY_NAME, COMPANIES.COMPANY_ABB, COMPANIES.ISACTIVE"
        vSQL &= " FROM COMPANIES "
        If Not pCurProj = 0 Then
            vSQL &= " LEFT OUTER JOIN DEFICIENCIES ON DEFICIENCIES.COMPANY_ID = COMPANIES.COMPANY_ID"
            vSQL &= " INNER JOIN USERS ON USERS.COMPANY_ID = COMPANIES.COMPANY_ID"
            vSQL &= " INNER JOIN USER_ROLES ON USER_ROLES.USER_ID = USERS.USER_ID"
            vSQL &= " WHERE USER_ROLES.PROJECT_ID = @PROJECT_ID OR DEFICIENCIES.PROJECT_ID = @PROJECT_ID"
        ElseIf pShowActiveOnly = True Then
            vSQL &= " WHERE COMPANIES.ISACTIVE = @ISACTIVE"
        End If

        vSQL &= " ORDER BY COMPANIES.COMPANY_NAME"

        vCompaniesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        If Not pCurProj = 0 Then
            vCompaniesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
            vCompaniesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        ElseIf pShowActiveOnly = True Then
            vCompaniesDataAdapter.SelectCommand.Parameters.Add("@ISACTIVE", SqlDbType.Bit, 1)
            vCompaniesDataAdapter.SelectCommand.Parameters("@ISACTIVE").Value = True
        End If

        Dim vCompaniesDataSet As New dsCommissioning

        vCompaniesDataAdapter.Fill(vCompaniesDataSet.COMPANIES)

        If Not pCurProj = 0 Then
            Dim CompanyRow As dsCommissioning.COMPANIESRow
            CompanyRow = vCompaniesDataSet.COMPANIES.NewCOMPANIESRow
            CompanyRow.COMPANY_ID = 0
            CompanyRow.COMPANY_ABB = "None"
            CompanyRow.COMPANY_NAME = "None"
            vCompaniesDataSet.COMPANIES.Rows.InsertAt(CompanyRow, 0)
        Else
            Dim CompanyRow As dsCommissioning.COMPANIESRow
            CompanyRow = vCompaniesDataSet.COMPANIES.FindByCOMPANY_ID(0)
            vCompaniesDataSet.COMPANIES.RemoveCOMPANIESRow(CompanyRow)
        End If


        vCommConn.Close()
        Return vCompaniesDataSet.COMPANIES
    End Function
    Public Shared Function UpdateCompanies(ByVal pCompaniesDS As dsCommissioning.COMPANIESDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vCompaniesDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vCompaniesDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO COMPANIES (COMPANY_NAME, COMPANY_ABB, ISACTIVE)" _
        & " VALUES (@COMPANY_NAME, @COMPANY_ABB, @ISACTIVE);" _
        & " SELECT *" _
        & " FROM COMPANIES" _
        & " WHERE (COMPANY_ID = @COMPANY_ID)", vCommConn)

        vCompaniesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.Int, 4, "COMPANY_ID"))
        vCompaniesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_NAME", SqlDbType.NVarChar, 50, "COMPANY_NAME"))
        vCompaniesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ABB", SqlDbType.NVarChar, 8, "COMPANY_ABB"))
        vCompaniesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISACTIVE", SqlDbType.Bit, 1, "ISACTIVE"))

        '--- Update Command ---
        vCompaniesDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE COMPANIES" _
        & " SET COMPANY_NAME = @COMPANY_NAME, COMPANY_ABB = @COMPANY_ABB, ISACTIVE = @ISACTIVE" _
        & " WHERE (COMPANY_ID = @COMPANY_ID);" _
        & " SELECT *" _
        & " FROM COMPANIES" _
        & " WHERE (COMPANY_ID = @COMPANY_ID)", vCommConn)

        vCompaniesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.Int, 4, "COMPANY_ID"))
        vCompaniesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_NAME", SqlDbType.NVarChar, 50, "COMPANY_NAME"))
        vCompaniesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ABB", SqlDbType.NVarChar, 8, "COMPANY_ABB"))
        vCompaniesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISACTIVE", SqlDbType.Bit, 1, "ISACTIVE"))

        '--- Delete Command ---
        vCompaniesDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM COMPANIES" _
        & " WHERE (COMPANY_ID = @COMPANY_ID)", vCommConn)

        vCompaniesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.Int, 4, "COMPANY_ID"))

        vCompaniesDataAdapter.Update(pCompaniesDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetUsers(ByVal pShowActiveOnly As Boolean) As dsCommissioning.USERSDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUsersDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT DISTINCT USER_ID, USER_NAME, USER_PASSWORD, USER_EMAIL, COMPANY_ID, USER_PHONE, ISACTIVE, ISADMIN,FirstName,LastName"
        vSQL &= " FROM USERS "

        If pShowActiveOnly = True Then
            vSQL &= " WHERE USERS.ISACTIVE = @ISACTIVE"
        End If
        vSQL &= " ORDER BY USERS.LastName"

        vUsersDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        If pShowActiveOnly = True Then
            vUsersDataAdapter.SelectCommand.Parameters.Add("@ISACTIVE", SqlDbType.Bit, 1)
            vUsersDataAdapter.SelectCommand.Parameters("@ISACTIVE").Value = True
        End If

        Dim vUsersDataSet As New dsCommissioning
        vUsersDataAdapter.Fill(vUsersDataSet.USERS)
        vCommConn.Close()
        Return vUsersDataSet.USERS
    End Function
    Public Shared Function UpdateUsers(ByVal pUsersDS As dsCommissioning.USERSDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUsersDataAdapter As New SqlDataAdapter
        '--- Insert Command ---
        vUsersDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO USERS (USER_NAME, USER_PASSWORD, " _
        & " USER_EMAIL, COMPANY_ID, USER_PHONE, ISADMIN, ISACTIVE,firstName,lastName)" _
        & " VALUES (@USER_NAME, @USER_PASSWORD, @USER_EMAIL, @COMPANY_ID," _
        & " @USER_PHONE, @ISADMIN, @ISACTIVE,@FirstName,@LastName);" _
        & " SELECT *" _
        & " FROM USERS" _
        & " WHERE (USER_ID = @USER_ID)", vCommConn)

        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_NAME", SqlDbType.NVarChar, 50, "USER_NAME"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_PASSWORD", SqlDbType.NVarChar, 128, "USER_PASSWORD"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_EMAIL", SqlDbType.NVarChar, 50, "USER_EMAIL"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.NVarChar, 50, "COMPANY_ID"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_PHONE", SqlDbType.NVarChar, 50, "USER_PHONE"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISADMIN", SqlDbType.Bit, 1, "ISADMIN"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISACTIVE", SqlDbType.Bit, 1, "ISACTIVE"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstName", SqlDbType.NVarChar, 100, "FirstName"))
        vUsersDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastName", SqlDbType.NVarChar, 100, "LastName"))


        '--- Update Command ---
        vUsersDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE USERS" _
        & " SET USER_NAME = @USER_NAME," _
        & " USER_PASSWORD = @USER_PASSWORD, USER_EMAIL = @USER_EMAIL," _
        & " COMPANY_ID = @COMPANY_ID, USER_PHONE = @USER_PHONE," _
        & " ISADMIN = @ISADMIN, ISACTIVE = @ISACTIVE, FirstName=@FirstName, lastName=@lastName" _
        & " WHERE (USER_ID = @USER_ID);" _
        & " SELECT *" _
        & " FROM USERS" _
        & " WHERE (USER_ID = @USER_ID)", vCommConn)

        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_NAME", SqlDbType.NVarChar, 50, "USER_NAME"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_PASSWORD", SqlDbType.NVarChar, 128, "USER_PASSWORD"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_EMAIL", SqlDbType.NVarChar, 50, "USER_EMAIL"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@COMPANY_ID", SqlDbType.NVarChar, 50, "COMPANY_ID"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_PHONE", SqlDbType.NVarChar, 50, "USER_PHONE"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISADMIN", SqlDbType.Bit, 1, "ISADMIN"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ISACTIVE", SqlDbType.Bit, 1, "ISACTIVE"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@FirstName", SqlDbType.NVarChar, 100, "FirstName"))
        vUsersDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LastName", SqlDbType.NVarChar, 100, "LastName"))


        '--- Delete Command ---
        vUsersDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM USERS" _
        & " WHERE (USER_ID = @USER_ID)", vCommConn)

        vUsersDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))

        vUsersDataAdapter.Update(pUsersDS)

        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetCompany_Heirachy(ByVal pCurProj As Integer, ByVal pCompany_HeirachyDS As dsCommissioning.COMPANY_HEIRACHYDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUser_RolesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM COMPANY_HEIRACHY "
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "

        vUser_RolesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vUser_RolesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj

        vUser_RolesDataAdapter.Fill(pCompany_HeirachyDS)
        vCommConn.Close()
        Return True
    End Function
    Public Shared Function UpdateCompany_Heirachy(ByVal pCompany_HeirachyDS As dsCommissioning.COMPANY_HEIRACHYDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUser_RolesDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vUser_RolesDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO COMPANY_HEIRACHY (PROJECT_ID, PARENT_COMPANY_ID, SUB_COMPANY_ID)" _
        & " VALUES (@PROJECT_ID, @PARENT_COMPANY_ID, @SUB_COMPANY_ID);" _
        & " SELECT *" _
        & " FROM COMPANY_HEIRACHY" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND PARENT_COMPANY_ID = @PARENT_COMPANY_ID AND SUB_COMPANY_ID = @SUB_COMPANY_ID)", vCommConn)

        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PARENT_COMPANY_ID", SqlDbType.Int, 4, "PARENT_COMPANY_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@SUB_COMPANY_ID", SqlDbType.Int, 4, "SUB_COMPANY_ID"))


        vUser_RolesDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE COMPANY_HEIRACHY" _
        & " SET PROJECT_ID = @PROJECT_ID, PARENT_COMPANY_ID = @PARENT_COMPANY_ID, SUB_COMPANY_ID = @SUB_COMPANY_ID " _
        & " WHERE (PROJECT_ID = @Original_PROJECT_ID) AND (SUB_COMPANY_ID = @Original_SUB_COMPANY_ID) AND (PARENT_COMPANY_ID = @Original_PARENT_COMPANY_ID); " _
        & " SELECT PROJECT_ID, PARENT_COMPANY_ID, SUB_COMPANY_ID " _
        & " FROM COMPANY_HEIRACHY " _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND (PARENT_COMPANY_ID = @PARENT_COMPANY_ID) AND (SUB_COMPANY_ID = @SUB_COMPANY_ID)", vCommConn)

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", System.Data.SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PARENT_COMPANY_ID", System.Data.SqlDbType.Int, 4, "PARENT_COMPANY_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@SUB_COMPANY_ID", System.Data.SqlDbType.Int, 4, "SUB_COMPANY_ID"))

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PROJECT_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PROJECT_ID", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_SUB_COMPANY_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "SUB_COMPANY_ID", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PARENT_COMPANY_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PARENT_COMPANY_ID", System.Data.DataRowVersion.Original, Nothing))

        '--- Delete Command ---
        vUser_RolesDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM COMPANY_HEIRACHY" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND PARENT_COMPANY_ID = @PARENT_COMPANY_ID AND SUB_COMPANY_ID = @SUB_COMPANY_ID)", vCommConn)

        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PARENT_COMPANY_ID", SqlDbType.Int, 4, "PARENT_COMPANY_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@SUB_COMPANY_ID", SqlDbType.Int, 4, "SUB_COMPANY_ID"))

        vUser_RolesDataAdapter.Update(pCompany_HeirachyDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetTrades(ByVal pCurProj As Integer, ByVal pFullList As Boolean) As dsCommissioning.TRADESDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vTradesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT DISTINCT TRADES.TRADE_ID, TRADES.TRADE_DESC"
        vSQL &= " FROM TRADES "

        If pFullList = False Then
            vSQL &= " INNER JOIN USER_ROLES ON TRADES.TRADE_ID = USER_ROLES.TRADE_ID "
            vSQL &= " WHERE USER_ROLES.PROJECT_ID = @PROJECT_ID "
        End If
        vSQL &= " ORDER BY TRADES.TRADE_DESC"

        vTradesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        If pFullList = False Then
            vTradesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
            vTradesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        End If

        Dim vTradesDataSet As New dsCommissioning
        vTradesDataAdapter.Fill(vTradesDataSet.TRADES)
        vCommConn.Close()
        Return vTradesDataSet.TRADES
    End Function

    Public Shared Function GetUsage_Log(ByVal pUsage_LogDS As dsCommissioning.USAGE_LOGDataTable) As Boolean
        'ByVal pCurProj As Integer, ByVal pCurUser As Integer, ByVal pDateBegin As DateTime, ByVal pDateEnd As DateTime,

        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        'If pDateEnd = Date.Today Then
        '    pDateEnd = DateTime.Now
        'End If

        Dim vUser_RolesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM USAGE_LOG "

        'vSQL &= " WHERE (LOGIN_TIME < @LOGIN_TIME_END) "
        'If Not pCurProj = -1 Then
        '    vSQL &= " AND (PROJECT_ID = @PROJECT_ID) "
        'End If
        'If Not pCurUser = -1 Then
        '    vSQL &= " AND (USER_ID = @USER_ID) "
        'End If
        'If Not pDateBegin = #12:00:00 AM# Then
        '    vSQL &= " AND (LOGIN_TIME > @LOGIN_TIME_BEGIN) "
        'End If
        vSQL &= " ORDER BY LOGIN_TIME "

        vUser_RolesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        'vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@LOGIN_TIME_END", SqlDbType.DateTime, 8)
        'vUser_RolesDataAdapter.SelectCommand.Parameters("@LOGIN_TIME_END").Value = pDateEnd
        'If Not pCurProj = -1 Then
        '    vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        '    vUser_RolesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        'End If
        'If Not pCurUser = -1 Then
        '    vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@USER_ID", SqlDbType.Int, 4)
        '    vUser_RolesDataAdapter.SelectCommand.Parameters("@USER_ID").Value = pCurUser
        'End If
        'If Not pDateBegin = #12:00:00 AM# Then
        '    vUser_RolesDataAdapter.SelectCommand.Parameters.Add("@LOGIN_TIME_BEGIN", SqlDbType.DateTime, 8)
        '    vUser_RolesDataAdapter.SelectCommand.Parameters("@LOGIN_TIME_BEGIN").Value = pDateBegin
        'End If


        vUser_RolesDataAdapter.Fill(pUsage_LogDS)
        vCommConn.Close()
        Return True
    End Function
    Public Shared Function UpdateUsage_Log(ByVal pUsage_LogDS As dsCommissioning.USAGE_LOGDataTable) As Boolean
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vUser_RolesDataAdapter As New SqlDataAdapter

        '--- Insert Command ---
        vUser_RolesDataAdapter.InsertCommand = New SqlCommand("" _
        & "INSERT INTO USAGE_LOG (PROJECT_ID, USER_ID, LOGIN_TIME)" _
        & " VALUES (@PROJECT_ID, @USER_ID, @LOGIN_TIME);" _
        & " SELECT *" _
        & " FROM USAGE_LOG" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND LOGIN_TIME = @LOGIN_TIME)", vCommConn)

        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.InsertCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LOGIN_TIME", SqlDbType.DateTime, 8, "LOGIN_TIME"))

        '--- Update Command ---
        vUser_RolesDataAdapter.UpdateCommand = New SqlCommand("" _
        & "UPDATE USAGE_LOG" _
        & " SET PROJECT_ID = @PROJECT_ID, USER_ID = @USER_ID, LOGIN_TIME = @LOGIN_TIME " _
        & " WHERE (PROJECT_ID = @Original_PROJECT_ID) AND (LOGIN_TIME = @Original_LOGIN_TIME) AND (USER_ID = @Original_USER_ID); " _
        & " SELECT PROJECT_ID, USER_ID, LOGIN_TIME " _
        & " FROM USAGE_LOG " _
        & " WHERE (PROJECT_ID = @PROJECT_ID) AND (LOGIN_TIME = @LOGIN_TIME) AND (USER_ID = @USER_ID)", vCommConn)

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", System.Data.SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", System.Data.SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LOGIN_TIME", System.Data.SqlDbType.DateTime, 8, "LOGIN_TIME"))

        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_PROJECT_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "PROJECT_ID", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_LOGIN_TIME", System.Data.SqlDbType.DateTime, 8, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "LOGIN_TIME", System.Data.DataRowVersion.Original, Nothing))
        vUser_RolesDataAdapter.UpdateCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@Original_USER_ID", System.Data.SqlDbType.Int, 4, System.Data.ParameterDirection.Input, False, CType(0, Byte), CType(0, Byte), "USER_ID", System.Data.DataRowVersion.Original, Nothing))

        '--- Delete Command ---
        vUser_RolesDataAdapter.DeleteCommand = New SqlCommand("" _
        & "DELETE " _
        & " FROM USAGE_LOG" _
        & " WHERE (PROJECT_ID = @PROJECT_ID AND USER_ID = @USER_ID AND LOGIN_TIME = @LOGIN_TIME)", vCommConn)

        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@PROJECT_ID", SqlDbType.Int, 4, "PROJECT_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@USER_ID", SqlDbType.Int, 4, "USER_ID"))
        vUser_RolesDataAdapter.DeleteCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@LOGIN_TIME", SqlDbType.DateTime, 8, "LOGIN_TIME"))

        vUser_RolesDataAdapter.Update(pUsage_LogDS)
        vCommConn.Close()
        Return True
    End Function

    Public Shared Function GetTotalDef(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT * "
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj


        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetTotalDefOpen(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "
        vSQL &= " AND ITEM_STATUS = @ITEM_STATUS"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = "Open"

        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetDefNoResponse(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE (PROJECT_ID = @PROJECT_ID) "
        vSQL &= " AND (ITEM_COMMENT = '' OR ITEM_COMMENT IS NULL)"
        vSQL &= " AND (ITEM_STATUS = @ITEM_STATUS)"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = "Open"

        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetDefReponseOpen(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE (PROJECT_ID = @PROJECT_ID) "
        vSQL &= " AND (ITEM_COMMENT <> '' AND ITEM_COMMENT IS NOT NULL)"
        vSQL &= " AND (ITEM_STATUS = @ITEM_STATUS)"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = "Open"

        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetTotalDefPending(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "
        vSQL &= " AND ITEM_STATUS = @ITEM_STATUS"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = "Pending Verification"

        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetTotalDefClosed(ByVal pCurProj As Integer) As Integer
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String
        vSQL = "SELECT *"
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE PROJECT_ID = @PROJECT_ID "
        vSQL &= " AND ITEM_STATUS = @ITEM_STATUS"

        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj
        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = "Closed"

        Dim vDeficienciesDataSet As New dsCommissioning

        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.DEFICIENCIES)
        vCommConn.Close()
        Return vDeficienciesDataSet.DEFICIENCIES.Rows.Count
    End Function
    Public Shared Function GetLastestDateDef(ByVal pCurProj As Integer) As Date
        Try
            vCommConn.Open()
        Catch ex As Exception
            'MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vSQL As String
        vSQL = "SELECT MAX(DATE_POSTED) "
        vSQL &= " FROM DEFICIENCIES"
        vSQL &= " WHERE (PROJECT_ID = " & pCurProj & ")"

        Dim vDReadCommand As New SqlCommand(vSQL, vCommConn)
        Dim vDReader As SqlDataReader
        vDReader = vDReadCommand.ExecuteReader()

        Dim CurDate As Date
        While vDReader.Read()
            If Not vDReader.IsDBNull(0) Then
                CurDate = vDReader.GetValue(0)
            End If
        End While
        vCommConn.Close()
        If Not CurDate = Nothing Then
            Return CurDate
        Else
            Return Nothing
        End If

    End Function

    Public Shared Function GetRPTProjectContacts(ByVal pCurProj As Integer) As dsCommissioning.RPT_PROJ_CONTACTDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try

        Dim vContactsDataAdapter As New SqlDataAdapter
        Dim vSQL As String

        vSQL = "SELECT USER_ROLES.USER_ID, USER_ROLES.TRADE_ID, USERS.USER_NAME, "
        vSQL &= " USERS.USER_EMAIL, USERS.USER_PHONE, COMPANIES.COMPANY_NAME, "
        vSQL &= " TRADES.TRADE_DESC "

        vSQL &= " FROM USER_ROLES "
        vSQL &= " INNER JOIN TRADES ON USER_ROLES.TRADE_ID = TRADES.TRADE_ID "
        vSQL &= " INNER JOIN USERS ON USER_ROLES.USER_ID = USERS.USER_ID "
        vSQL &= " INNER JOIN COMPANIES ON USERS.COMPANY_ID = COMPANIES.COMPANY_ID "

        vSQL &= " WHERE (USER_ROLES.PROJECT_ID = @PROJECT_ID)"

        vContactsDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)
        vContactsDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vContactsDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj

        Dim vContactsDataSet As New dsCommissioning
        vContactsDataAdapter.Fill(vContactsDataSet.RPT_PROJ_CONTACT)

        vCommConn.Close()
        Return vContactsDataSet.RPT_PROJ_CONTACT
    End Function
    Public Shared Function GetRPTDeficiencies(ByVal pCurProj As Integer, ByVal pCurCompany As Integer, ByVal pStatus As String, ByVal pCurSort As String) As dsCommissioning.RPT_DEFICIENCIESDataTable
        Try
            vCommConn.Open()
        Catch ex As Exception

        End Try

        Dim vDeficienciesDataAdapter As New SqlDataAdapter
        Dim vSQL As String

        vSQL = "SELECT DISTINCT DEFICIENCIES.ITEM_NUMBER, DEFICIENCIES.TAG_ID, DEFICIENCIES.ITEM_DESC, "
        vSQL &= " DEFICIENCIES.ITEM_STATUS, DEFICIENCIES.DATE_POSTED, COMPANIES.COMPANY_ABB, "
        vSQL &= " DEFICIENCIES.ITEM_COMMENT "

        vSQL &= " FROM DEFICIENCIES "
        vSQL &= " LEFT OUTER JOIN COMPANIES ON DEFICIENCIES.COMPANY_ID = COMPANIES.COMPANY_ID "
      

        vSQL &= " WHERE (DEFICIENCIES.PROJECT_ID = @PROJECT_ID)"
        If Not pCurCompany = Nothing Then
            vSQL &= " AND (DEFICIENCIES.COMPANY_ID = @COMPANY_ID)"
        End If

        If Not pStatus = "All" Then
            If pStatus = "Both" Then
                vSQL &= " AND (DEFICIENCIES.ITEM_STATUS = 'Open' OR DEFICIENCIES.ITEM_STATUS = 'Pending Verification')"
            Else
                vSQL &= " AND (DEFICIENCIES.ITEM_STATUS = @ITEM_STATUS)"
            End If
        End If
        If Not pCurSort Is Nothing Then
            vSQL &= " ORDER BY " & pCurSort
        Else
            vSQL &= " ORDER BY DEFICIENCIES.ITEM_NUMBER"
        End If
        vDeficienciesDataAdapter.SelectCommand = New SqlCommand(vSQL, vCommConn)

        vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@PROJECT_ID", SqlDbType.Int, 4)
        vDeficienciesDataAdapter.SelectCommand.Parameters("@PROJECT_ID").Value = pCurProj

        If Not pCurCompany = Nothing Then
            vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@COMPANY_ID", SqlDbType.Int, 4)
            vDeficienciesDataAdapter.SelectCommand.Parameters("@COMPANY_ID").Value = pCurCompany
        End If
        If Not pStatus = "All" And Not pStatus = "Both" Then
            vDeficienciesDataAdapter.SelectCommand.Parameters.Add("@ITEM_STATUS", SqlDbType.NVarChar, 32)
            vDeficienciesDataAdapter.SelectCommand.Parameters("@ITEM_STATUS").Value = pStatus
        End If

        Dim vDeficienciesDataSet As New dsCommissioning
        vDeficienciesDataAdapter.Fill(vDeficienciesDataSet.RPT_DEFICIENCIES)

        'Dim vDeficiencyCurRow As dsCommissioning.RPT_DEFICIENCIESRow
        'For Each vDeficiencyCurRow In vDeficienciesDataSet.RPT_DEFICIENCIES
        '    If Not vDeficiencyCurRow.IsITEM_STATUSNull Then
        '        Select Case vDeficiencyCurRow.ITEM_STATUS
        '            Case True
        '                vDeficiencyCurRow.ITEM_STATUS = "Closed"
        '            Case False
        '                vDeficiencyCurRow.ITEM_STATUS = "Open"
        '        End Select
        '    End If
        'Next

        vCommConn.Close()
        Return vDeficienciesDataSet.RPT_DEFICIENCIES
    End Function
End Class
