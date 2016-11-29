<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AssignUserRoles.aspx.vb" Inherits="AssignUserRoles" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<asp:Content runat="server" ContentPlaceHolderID="mainContent">
    <form id="AssignUserRoles" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Assign Users to Project</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Select a Project to Assign Users Roles</label>
                <dxwdc:ASPxComboBox ID="ProjectSelectPulldown" runat="server" Width="100%"
                    AutoPostBack="True" EnableIncrementalFiltering="True"
                    ValueType="System.Int32" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <dxwgv:ASPxGridView ID="G1" runat="server" Width="100%"
                    AutoGenerateColumns="False" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                    <SettingsEditing Mode="EditForm" />
                    <Styles>
                        <Header Font-Bold="True">
                        </Header>
                        <FocusedRow ForeColor="White">
                        </FocusedRow>
                    </Styles>
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" Caption=" " Width="90px">
                            <EditButton Visible="True">
                            </EditButton>
                            <NewButton Visible="True">
                            </NewButton>
                            <DeleteButton Visible="True">
                            </DeleteButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Trade" FieldName="TRADE_ID"
                            VisibleIndex="1" SortIndex="0" SortOrder="Ascending">
                            <PropertiesComboBox DataSourceID="TradesDS" TextField="TRADE_DESC"
                                ValueField="TRADE_ID" ValueType="System.Int32" EnableIncrementalFiltering="True">
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" AllowSort="True"
                                AutoFilterCondition="Contains" SortMode="DisplayText" />
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Company" FieldName="COMPANY_ID"
                            VisibleIndex="2" SortIndex="1" SortOrder="Ascending">
                            <PropertiesComboBox DataSourceID="UserDS" TextField="COMPANY_NAME"
                                ValueField="COMPANY_ID" ValueType="System.Int32" EnableIncrementalFiltering="True">
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" AllowSort="True"
                                AutoFilterCondition="Contains" SortMode="DisplayText" />
                        </dxwgv:GridViewDataComboBoxColumn>
                    </Columns>
                    <SettingsCookies Enabled="True" />
                    <Settings ShowFilterRow="True" />
                </dxwgv:ASPxGridView>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12 text-right">
                <asp:LinkButton ID="BTNCancel" runat="server" Width="100%">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <asp:ObjectDataSource ID="TradesDS" runat="server" SelectMethod="GetTrades" TypeName="cxClass">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="pCurProj" Type="Int32" />
                <asp:Parameter DefaultValue="True" Name="pFullList" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="UserDS" runat="server" SelectMethod="GetCompanies" TypeName="cxClass">
            <SelectParameters>
                <asp:Parameter Name="pCurProj" Type="Int32" />
                <asp:Parameter DefaultValue="False" Name="pShowActiveOnly" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>


