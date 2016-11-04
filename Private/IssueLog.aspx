<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IssueLog.aspx.vb" Inherits="IssueLog" %>


<%@ Register assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>


<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" 
    namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.2"  Namespace="DevExpress.Web.ASPxClasses"	TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.2" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.2" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>  


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta id="IE8CompatibilityMeta" runat="server" http-equiv="X-UA-Compatible" content="IE=7" /> 
    <title>BVH Commissioning Portal - Issue Log</title>
    <link href="../site_wide.css" rel="stylesheet" type="text/css" />

    <script type="text/JavaScript">
        function OnUpdateClick() {
            uploader.UploadFile();
        }
        function DetailGridUpdateEdit(e, grid) {
            if (e.isValid) {
                grid.UpdateEdit();
            }
        }

        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document; if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
        }

        function __doPostBack() {
            Page.GetPostBackEventReference()
        }
    </script>


</head>
<body onload="MM_preloadImages('../../graphics/hmenu_over_02.gif','../../graphics/hmenu_over_03.gif','../graphics/hmenu_over_04.gif','../graphics/hmenu_over_05.gif','../graphics/hmenu_over_06.gif')">
    <form id="IssueLog" runat="server" enctype="multipart/form-data">
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="160"><img src="../graphics/vtop_01.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/stop_01.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/stop_02.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/vtop_03.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/top__05.jpg" width="160" height="48" alt="" /></td>
        </tr>
        
      <tr>
            <td><a runat="server" href="../cxLogin.aspx" onclick="__doPostBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','../graphics/hmenu_over_02.gif',1)"><img src="../graphics/hmenu_02.gif" name="Image5" width="160" height="23" border="0" id="Image5" alt="" /></a></td>
            <td><a runat="server" href="ProjectSelect.aspx" onclick="__doPostBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','../graphics/hmenu_over_03.gif',1)"><img src="../graphics/hmenu_03.gif" name="Image6" width="160" height="23" border="0" id="Image6" alt="" /></a></td>
            <td><a runat="server" href="ProjectSummary.aspx" onclick="__doPostBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','../graphics/hmenu_over_04.gif',1)"><img src="../graphics/hmenu_04.gif" name="Image7" width="160" height="23" border="0" id="Image7" alt="" /></a></td>
            <td><a runat="server" href="IssueLog.aspx" onclick="__doPostBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','../graphics/hmenu_over_05.gif',1)"><img src="../graphics/hmenu_over_05.gif" name="Image8" width="160" height="23" border="0" id="Image8" alt="" /></a></td>
            <td><a runat="server" href="../Help.aspx" onclick="__doPostBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','../graphics/hmenu_over_06.gif',1)"><img src="../graphics/hmenu_06.gif" name="Image9" width="160" height="23" border="0" id="Image9" alt="" /></a></td>
      </tr>
        


       <tr>
            <td colspan="5" valign="top" bgcolor="#FFFFFF">
                <table width="800" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="7" height="7"><img src="../graphics/1pix.gif" height="7" width="7" alt="" /></td>
                        <td width="153"><img src="../graphics/1pix.gif" height="7" width="153" alt="" /></td>
                        <td width="29"><img src="../graphics/1pix.gif" width="29" height="7" alt="" /></td>
                        <td width="45"><img src="../graphics/1pix.gif" height="7" width="45" alt="" /></td>
                        <td width="200"><img src="../graphics/1pix.gif" height="7" width="200" alt="" /></td>
                        <td width="19"><img src="../graphics/1pix.gif" width="19" height="7" alt="" /></td>
                        <td width="50"><img src="../graphics/1pix.gif" height="7" width="50" alt="" /></td>
                        <td width="200"><img src="../graphics/1pix.gif" height="7" width="200" alt="" /></td>
                        <td width="87"><img src="../graphics/1pix.gif" height="7" width="87" alt="" /></td>
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="7" alt="" /></td>
                    </tr>
                    <tr>
                        <td><img src="../graphics/1pix.gif" width="7" alt="" /></td>
                        <td height="14" valign="bottom" class="login_text_bold"><dxwdc:ASPxLabel ID="LBLCurUser" runat="server" Text="Welcome, Greg Alverson" CssClass="login_text_bold"></dxwdc:ASPxLabel></td>
                        <td rowspan="2">&nbsp;</td>
                        <td valign="top" colspan="6" rowspan="2" class="text_blue_bold"><dxwdc:ASPxLabel ID="LBLProjName" runat="server" Text="Project Name" CssClass="text_blue_bold" Width="100%"></dxwdc:ASPxLabel></td>
                        <td rowspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><img src="../graphics/1pix.gif" width="7" height="10" alt="" /></td>
                        <td height="10" valign="top" align="left" class="project_list_reg"><a id="A1" runat="server" href="../cxLogin.aspx" onclick="__doPostBack()">Sign out</a></td>
                    </tr>
                    <tr>
                        <td height="11" colspan="10" valign="top"><img src="../graphics/1pix.gif" height="11" width="160" alt="" /></td>
                    </tr>
                    <tr>
                        <td width="7"><img src="../graphics/1pix.gif" width="7" height="429" alt="" /></td>
                        <td width="783" height="420" valign="top" colspan="8" class="text_reg">
                            <dxwgv:ASPxGridView ID="G1" ClientInstanceName="G1" runat="server" Width="100%" AutoGenerateColumns="False"
                                KeyFieldName="ITEM_NUMBER" CssClass="text_reg" Font-Names="Verdana" Font-Size="12px">
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
                                                                <dxe:ASPxHyperLink ID="ASPxImage1" runat="server" Width="65px" NavigateUrl='<%# "FileHandler.ashx?id=" + Eval("ID") %>' Text="Click Here" target="_blank" >
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
                                                                                <dxw:contentcontrol runat="server">
                                                                                    <dxe:ASPxLabel ID="lblDesc" runat="server" Width="300px" Text="Description:">
                                                                                    </dxe:ASPxLabel>
                                                                                    <dxe:ASPxTextBox ID="txbDesc" runat="server" MaxLength="135" Width="650px" Text='<%# Eval("Description") %>'>
                                                                                    </dxe:ASPxTextBox>
                                                                                </dxw:contentcontrol>
                                                                            </ContentCollection>
                                                                        </dxtc:TabPage>
                                                                        <dxtc:TabPage Text="Photo">
                                                                            <ContentCollection>
                                                                                <dxw:contentcontrol runat="server">
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
                                                                                                                    <td>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                      <dxuc:ASPxUploadControl runat="server" ClientInstanceName="uploader" Size="35" ID="ASPxUploadControl1" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                                                                                                      ClientSideEvents-FileUploadComplete='<%# GetFileUploadComplete(Container) %>' >
                                                                                                                            <ValidationSettings AllowedContentTypes="image/jpeg,image/pjpeg" MaxFileSize="2000000">
                                                                                                                            </ValidationSettings>
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
                                                                                </dxw:contentcontrol>
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
                                                    <SettingsDetail IsDetailGrid="True"/>
                                                                                
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
                                    <dxwgv:GridViewCommandColumn Caption=" " Name="Btns" VisibleIndex="0" Width="23px">
                                        <EditButton Visible="True">
                                        </EditButton>
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
                                                <dxwdc:ListEditItem Text="Open" Value="Open">
                                                </dxwdc:ListEditItem>
                                                <dxwdc:ListEditItem Text="Pending Verification" Value="Pending Verification">
                                                </dxwdc:ListEditItem>
                                                <dxwdc:ListEditItem Text="Closed" Value="Closed">
                                                </dxwdc:ListEditItem>
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
                        </td>
                        <td width="10">
                            <img src="../graphics/1pix.gif" width="10" height="429" alt="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" height="29"><table width="800" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="13" height="29"><img src="../graphics/1pix.gif" width="29" height="29" alt="" /></td>
                                    <td width="113" valign="middle" align="left" class="text_reg"><asp:LinkButton ID="BTNAddIssues" runat="server" CssClass="text_reg">Add Issue to Log</asp:LinkButton></td>
                                    <td width="59"><img src="../graphics/1pix.gif" width="15" height="29" alt="" /></td>
                                    <td width="110" valign="middle" align="center" class="text_reg"><asp:LinkButton ID="BTNContacts" runat="server" CssClass="text_reg">Project Contacts</asp:LinkButton></td>
                                    <td width="59"><img src="../graphics/1pix.gif" width="15" height="29" alt="" /></td>
                                    <td width="89" valign="middle" align="center" class="text_reg"><asp:LinkButton ID="BTNCompanyKey" runat="server" CssClass="text_reg">Action Codes</asp:LinkButton></td>
                                    <td width="59"><img src="../graphics/1pix.gif" width="15" height="29" alt="" /></td>
                                    <td width="112" valign="middle" align="center" class="text_reg"><asp:LinkButton ID="BTNIssuesReport" runat="server" CssClass="text_reg">Printable Version</asp:LinkButton></td>
                                    <td width="59"><img src="../graphics/1pix.gif" width="15" height="29" alt="" /></td>
                                    <td width="117" valign="middle" align="right" class="text_reg"><asp:LinkButton ID="BTNAddResponse" runat="server" CssClass="text_reg">Respond to Issue</asp:LinkButton></td>
                                    <td width="10"><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                                </tr>
                            </table></td>
                    </tr>
                </table></td>
        </tr>
        <tr>
            <td height="7" colspan="5" bgcolor="#FFFFFF"><img src="../graphics/1pix.gif" width="800" height="7" alt="" /></td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="CompanyDS" runat="server" SelectMethod="GetCompanies" TypeName="cxClass">
        <SelectParameters>
            <asp:SessionParameter Name="pCurProj" SessionField="CurProjectID" Type="Int32" />
            <asp:Parameter DefaultValue="False" Name="pShowActiveOnly" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" 
        CloseAction="CloseButton" HeaderText="" Modal="True" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        Text="Please Select a Project to Continue" >
        <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" 
            ForeColor="#666666" HorizontalAlign="Center" Wrap="True">
        </ContentStyle>
                <ContentCollection>
<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">

<table style="border:none">
<tr>
<td><br /></td>
</tr>
<tr>
<td><dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" 
        Text="Ok" Width="75px">
    </dxwdc:ASPxButton></td>
</tr>
</table> 
    
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
        InsertCommand="INSERT INTO [Photos] ([ID], [Bytes], [Description], [PROJECT_ID], [ITEM_NUMBER]) VALUES (@ID, @Bytes, @Description, @Project_ID, @Item_Number)" 
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
</body>
</html>
