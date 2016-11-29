<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IssueLog.aspx.vb" Inherits="IssueLog" MasterPageFile="~/MasterPage-issuelog.master" %>


<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>


<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.2" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.2" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.2" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<asp:Content ContentPlaceHolderID="mainContent" runat="server">
    <form id="IssueLog" runat="server" enctype="multipart/form-data">
        <div class="row">
            <div class="col-md-3">
                <ul class="nonbullet" style="padding-left:0px;">
                    <li>
                        <dxwdc:ASPxLabel ID="LBLCurUser" runat="server" Text="Welcome, Greg Alverson" CssClass="login_text_bold"></dxwdc:ASPxLabel>
                    </li>
                    <li><a id="A1" runat="server" href="../cxLogin.aspx" onclick="__doPostBack()">Sign out</a></li>
                </ul>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxLabel ID="LBLProjName" runat="server" Text="Project Name" CssClass="blue-text" Width="100%"></dxwdc:ASPxLabel>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <dxwgv:ASPxGridView ID="G1" ClientInstanceName="G1" runat="server" Width="100%" AutoGenerateColumns="False"
                    KeyFieldName="ITEM_NUMBER" CssClass="text_reg issue-log" Font-Names="Verdana" Font-Size="12px">
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Width="100%" CssClass="text_reg" Font-Names="Verdana" Font-Size="12px" OnRowInserting="ASPxGridView2_RowInserting" OnBeforePerformDataSelect="ASPxGridView2_DataSelect" ClientInstanceName='<%# string.Format("detailGrid{0}", Container.VisibleIndex) %>'>
                                <Columns>
                                    <dxwgv:GridViewCommandColumn VisibleIndex="0" Caption=" ">
                                        <ClearFilterButton Visible="True">
                                        </ClearFilterButton>
                                        <DeleteButton Visible="True">
                                        </DeleteButton>
                                        <NewButton Visible="True">
                                        </NewButton>
                                    </dxwgv:GridViewCommandColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Description" VisibleIndex="1" Width="530px">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Image" Name="Image" VisibleIndex="2">
                                        <DataItemTemplate>
                                            <dxe:ASPxHyperLink ID="ASPxImage1" runat="server" Width="65px" NavigateUrl='<%# "FileHandler.ashx?id=" + Eval("ID") %>' Text="Click Here" target="_blank">
                                            </dxe:ASPxHyperLink>
                                        </DataItemTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <Templates>
                                    <EditForm>
                                        <div style="padding: 4px 4px 3px 4px">
                                            <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%"
                                                Height="110px" ActiveTabIndex="1">


                                                <TabPages>
                                                    <dxtc:TabPage Text="Description">
                                                        <ContentCollection>
                                                            <dxw:ContentControl runat="server">
                                                                <dxe:ASPxLabel ID="lblDesc" runat="server" Width="300px" Text="Description:">
                                                                </dxe:ASPxLabel>
                                                                <dxe:ASPxTextBox ID="txbDesc" runat="server" MaxLength="135" Width="650px" Text='<%# Eval("Description") %>'>
                                                                </dxe:ASPxTextBox>
                                                            </dxw:ContentControl>
                                                        </ContentCollection>
                                                    </dxtc:TabPage>
                                                    <dxtc:TabPage Text="Photo">
                                                        <ContentCollection>
                                                            <dxw:ContentControl runat="server">
                                                                <table border="0" cellpadding="0" cellspacing="0" id="Table1">
                                                                    <tr>
                                                                        <td valign="top" align="center" class="content">
                                                                            <table cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                    <td align="center" style="padding-right: 20px; vertical-align: top;">
                                                                                        <table cellpadding="0" cellspacing="0">
                                                                                            <tr>
                                                                                                <td class="caption">
                                                                                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Select Image:" AssociatedControlID="uplImage">
                                                                                                    </dxe:ASPxLabel>
                                                                                                </td>
                                                                                                <td></td>
                                                                                                <td>
                                                                                                    <dxuc:ASPxUploadControl runat="server" ClientInstanceName="uploader" Size="35" ID="ASPxUploadControl1" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                                                                                        ClientSideEvents-FileUploadComplete='<%# GetFileUploadComplete(Container) %>'>
                                                                                                        <validationsettings AllowedFileExtensions=".jpg, .jpeg, .doc, .docx, .xsl, .xlsx, .pdf, .csv" maxfilesize="2000000">
                                                                                                                            </validationsettings>
                                                                                                    </dxuc:ASPxUploadControl>
                                                                                                </td>
                                                                                                <td class="note">
                                                                                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Allowed ContentTypes: image/jpeg"
                                                                                                        Font-Size="8pt">
                                                                                                    </dxe:ASPxLabel>
                                                                                                    <br />
                                                                                                    <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Maximum file size: 2Mb" Font-Size="8pt">
                                                                                                    </dxe:ASPxLabel>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </dxw:ContentControl>
                                                        </ContentCollection>
                                                    </dxtc:TabPage>
                                                </TabPages>

                                            </dxtc:ASPxPageControl>
                                        </div>
                                        <div style="text-align: right; padding: 2px 2px 2px 2px">
                                            <a href="#" onclick="OnUpdateClick()">Update</a>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                runat="server">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                        </div>
                                    </EditForm>
                                </Templates>
                                <SettingsDetail IsDetailGrid="True" />

                            </dxwgv:ASPxGridView>


                        </DetailRow>
                    </Templates>
                    <SettingsBehavior AllowFocusedRow="True" AllowDragDrop="False"
                        AllowGroup="False" SortMode="DisplayText" AutoExpandAllGroups="True" />
                    <Styles>
                        <Header Font-Bold="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                            Wrap="True">
                        </Header>
                        <Row ForeColor="#666666">
                        </Row>
                        <SelectedRow ForeColor="White">
                        </SelectedRow>
                        <FocusedRow ForeColor="White">
                        </FocusedRow>
                    </Styles>
                    <SettingsEditing EditFormColumnCount="3" Mode="EditForm" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn Caption=" " Name="Btns" VisibleIndex="0" Width="80px">
                            <EditButton Visible="True">
                            </EditButton>
                            <DeleteButton Visible="True">
                            </DeleteButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="No." FieldName="ITEM_NUMBER" Name="Number"
                            SortIndex="0" SortOrder="Ascending" VisibleIndex="1" Width="30px">
                            <Settings AutoFilterCondition="Contains" SortMode="Value" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tag" FieldName="TAG_ID" VisibleIndex="2" Width="60px">
                            <PropertiesTextEdit>
                                <ValidationSettings CausesValidation="True" Display="Dynamic">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataMemoColumn Caption="Item Description" FieldName="ITEM_DESC" VisibleIndex="3"
                            Width="155px">
                            <PropertiesMemoEdit>
                                <ValidationSettings CausesValidation="True" Display="Dynamic">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesMemoEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataMemoColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Action By" FieldName="COMPANY_ID" VisibleIndex="4"
                            Width="50px">
                            <PropertiesComboBox DataSourceID="CompanyDS" DisplayImageSpacing="" EnableIncrementalFiltering="True"
                                TextField="COMPANY_ABB" ValueField="COMPANY_ID" ValueType="System.Int32">
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" AllowSort="True" AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataDateColumn Caption="Posted" FieldName="DATE_POSTED" VisibleIndex="5"
                            Width="70px">
                            <PropertiesDateEdit DisplayFormatString="yyyy/MM/dd">
                            </PropertiesDateEdit>
                            <Settings SortMode="Value" />
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Status" FieldName="ITEM_STATUS" VisibleIndex="6"
                            Width="70px">
                            <PropertiesComboBox ValueType="System.String">
                                <Items>
                                    <dxwdc:ListEditItem Text="Open" Value="Open"></dxwdc:ListEditItem>
                                    <dxwdc:ListEditItem Text="Pending Verification" Value="Pending Verification"></dxwdc:ListEditItem>
                                    <dxwdc:ListEditItem Text="Closed" Value="Closed"></dxwdc:ListEditItem>
                                </Items>
                            </PropertiesComboBox>
                            <Settings AutoFilterCondition="Contains" />
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataMemoColumn Caption="Response" FieldName="ITEM_COMMENT" VisibleIndex="7">
                            <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                        </dxwgv:GridViewDataMemoColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" ShowGroupButtons="False" ShowVerticalScrollBar="True"
                        VerticalScrollableHeight="400" />
                    <SettingsDetail ShowDetailRow="True" />
                </dxwgv:ASPxGridView>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-2 col-sm-3">
                <asp:LinkButton ID="BTNAddIssues" runat="server" CssClass="text_reg">Add Issue to Log</asp:LinkButton>
            </div>
            <div class="col-md-2 col-sm-2">
                <asp:LinkButton ID="BTNContacts" runat="server" CssClass="text_reg">Project Contacts</asp:LinkButton>
            </div>
            <div class="col-md-2 col-sm-2">
                <asp:LinkButton ID="BTNCompanyKey" runat="server" CssClass="text_reg">Action Codes</asp:LinkButton>
            </div>
            <div class="col-md-2 col-sm-3">
                <asp:LinkButton ID="BTNIssuesReport" runat="server" CssClass="text_reg">Printable Version</asp:LinkButton>
            </div>
            <div class="col-md-2 col-sm-2">
                <asp:LinkButton ID="BTNAddResponse" runat="server" CssClass="text_reg">Respond to Issue</asp:LinkButton>
            </div>
        </div>
        <asp:ObjectDataSource ID="CompanyDS" runat="server" SelectMethod="GetCompanies" TypeName="cxClass">
            <SelectParameters>
                <asp:SessionParameter Name="pCurProj" SessionField="CurProjectID" Type="Int32" />
                <asp:Parameter DefaultValue="False" Name="pShowActiveOnly" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>


        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server"
            CloseAction="CloseButton" HeaderText="" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            Text="Please Select a Project to Continue">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px"
                ForeColor="#666666" HorizontalAlign="Center" Wrap="True">
            </ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                     <div class="row">
                                <div class="col-md-12 text-center" style="margin-top:20px;">
                 
                                <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center"
                                    Text="Ok" Width="75px">
                                </dxwdc:ASPxButton>
                   </div>
                         </div>

                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:ASPxPopupControl>

        <dxpc:ASPxPopupControl ID="PopupControl2" runat="server" AllowDragging="True"
            AllowResize="True" CloseAction="CloseButton">
            <ContentStyle Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                HorizontalAlign="Left" Wrap="True">
            </ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommissioningConnectionString %>"
            SelectCommand="SELECT * FROM [PHOTOS] WHERE (([PROJECT_ID] = @PROJECT_ID) AND ([ITEM_NUMBER] = @ITEM_NUMBER))"
            InsertCommand="INSERT INTO [Photos] ([ID], [Description], [PROJECT_ID], [ITEM_NUMBER],[Url]) VALUES (@ID, @Description, @Project_ID, @Item_Number,@Url)"
            DeleteCommand="DELETE FROM [Photos] WHERE (([ID] = @ID) AND ([PROJECT_ID] = @PROJECT_ID) AND ([ITEM_NUMBER] = @ITEM_NUMBER))">

            <SelectParameters>
                <asp:SessionParameter Name="PROJECT_ID" SessionField="CurProjectID" Type="Int32" />
                <asp:SessionParameter Name="ITEM_NUMBER" SessionField="ITEM_NUMBER" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Bytes" />
                <asp:SessionParameter Name="PROJECT_ID" SessionField="CurProjectID" Type="Int32" />
                <asp:SessionParameter Name="ITEM_NUMBER" SessionField="ITEM_NUMBER" Type="Int32" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter DbType="String" Name="ID" />
                <asp:SessionParameter Name="PROJECT_ID" SessionField="CurProjectID" Type="Int32" />
                <asp:SessionParameter Name="ITEM_NUMBER" SessionField="ITEM_NUMBER" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

    </form>
</asp:Content>

