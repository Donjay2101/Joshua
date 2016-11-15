<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddCompany.aspx.vb" Inherits="AddCompany" MasterPageFile="~/MasterPage-afterLogin.master" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="AddCompany" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Add/Edit Company</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-4">
                <label class="grey-text">Select a Company to Edit</label>
            </div>
            <div class="col-md-8">
                <dxwdc:ASPxComboBox ID="CompanySelectPulldown" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" AutoPostBack="True"
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
            <div class="col-md-4">
                <label class="grey-text">Company Name:</label>
            </div>
            <div class="col-md-8">
                <dxwdc:ASPxTextBox ID="InputCompanyName" runat="server" Width="100%"
                    CssFilePath="~/App_Themes/Office2003 Silver/{0}/styles.css"
                    CssPostfix="Office2003_Silver" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" TabIndex="1">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-4">
                <label class="grey-text">Company Abbreviation:</label>
            </div>
            <div class="col-md-8">
                <dxwdc:ASPxTextBox ID="InputCompanyABB" runat="server" Width="100%"
                    TabIndex="2" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-4">
                 <dxwdc:ASPxCheckBox ID="InputCompanyActive" runat="server" Checked="false" 
                    Width="100%" Text="Company Active" TextAlign="Left" Layout="Flow"
                    TextSpacing="15px" TabIndex="3">
                </dxwdc:ASPxCheckBox>
            </div>
            <div class="col-md-5">
             
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 col-md-offset-6 col-sm-6 text-right">
                <asp:LinkButton ID="BTNUpdate" runat="server" Width="100%" CssClass="text_reg"
                    TabIndex="4">Add/Update Company</asp:LinkButton>
            
            </div>
            <div class="col-md-3 col-sm-6 text-right">
                    <asp:LinkButton ID="BTNCancel" runat="server" Width="100%" CssClass="text_reg">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue">
                    <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" Text="Ok" Width="75px"></dxwdc:ASPxButton>
                                </div>
                            </div>
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                    <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
                </dxpc:ASPxPopupControl>
            </div>
        </div>
    </form>
</asp:Content>
