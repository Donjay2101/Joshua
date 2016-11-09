<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewUsageLog.aspx.vb" Inherits="Admin_ViewUsageLog" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<asp:Content runat="server" ContentPlaceHolderID="mainContent">
    <form id="AssignUserRoles" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">View cxPortal Usage Log</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <dxwgv:ASPxGridView ID="G1" runat="server" AutoGenerateColumns="False"
                    Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <SettingsBehavior AllowGroup="False" AllowDragDrop="False"
                        SortMode="DisplayText" />
                    <Styles>
                        <Header Font-Bold="True">
                        </Header>
                        <FocusedRow ForeColor="White">
                        </FocusedRow>
                        <FilterBarExpressionCell Wrap="True">
                        </FilterBarExpressionCell>
                    </Styles>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="INDEX" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Project" FieldName="PROJECT_ID"
                            VisibleIndex="0" Name="ProjectCol">
                            <PropertiesComboBox DataSourceID="ProjectDS" TextField="PROJECT_NAME"
                                ValueField="PROJECT_ID" ValueType="System.Int32"
                                EnableIncrementalFiltering="True">
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" AllowSort="True"
                                AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="User" FieldName="USER_ID"
                            VisibleIndex="1" Width="170px">
                            <PropertiesComboBox DataSourceID="UserDS" TextField="USER_NAME"
                                ValueField="USER_ID" ValueType="System.Int32"
                                EnableIncrementalFiltering="True">
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" AllowSort="True"
                                AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataDateColumn Caption="Login Time" FieldName="LOGIN_TIME"
                            VisibleIndex="2" SortIndex="0" SortOrder="Descending" Width="100px">
                            <PropertiesDateEdit AllowUserInput="False" DisplayFormatString="yyyy/MM/dd">
                            </PropertiesDateEdit>
                        </dxwgv:GridViewDataDateColumn>
                    </Columns>
                    <Settings ShowGroupButtons="False"
                        UseFixedTableLayout="True" VerticalScrollableHeight="400"
                        ShowFilterRow="True" />
                </dxwgv:ASPxGridView>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12 text-right">
                <asp:LinkButton ID="BTNCancel" runat="server" Width="100%">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <asp:ObjectDataSource ID="ProjectDS" runat="server" SelectMethod="GetProjects" TypeName="cxClass">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="pCurProj" Type="Int32" />
                <asp:Parameter DefaultValue="True" Name="pIsUserAdmin" Type="Boolean" />
                <asp:Parameter DefaultValue="True" Name="pGetClosed" Type="Boolean" />
                <asp:SessionParameter DefaultValue="" Name="pCurUserID" SessionField="CurUserID"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="UserDS" runat="server" SelectMethod="GetUsers" TypeName="cxClass">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="pShowActiveOnly" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>

</asp:Content>
