<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddIssue.aspx.vb" Inherits="AddIssue" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="AddIssue" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Add Issues to Log</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Project Name:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="txtProjName" runat="server"
                    Text="Bridgeport Arena HVAC Modifications" Width="100%" TabIndex="99"
                    ReadOnly="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Item Tag:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputTag" runat="server" Text="" Width="100%"
                    TabIndex="1" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Action By:</label>
            </div>
            <div class="col-md-4">
                <dxwdc:ASPxComboBox ID="InputActionBy" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" ValueType="System.Int32"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" TabIndex="2">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxComboBox>
            </div>
            <div class="col-md-1">
                <label class="grey-text">Status:</label>
            </div>
            <div class="col-md-4">
                <dxwdc:ASPxComboBox ID="InputStatus" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" TabIndex="3">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Description:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="InputDesc" runat="server" Width="100%" Height="120px"
                    TabIndex="4" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="grey-text">Image 1 Description</label>
                <dxwdc:ASPxTextBox ID="PhotoDesc1" runat="server" Text="" Width="100%"
                    TabIndex="5" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                    MaxLength="135">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="grey-text">Image 2 Description</label>
                <dxwdc:ASPxTextBox ID="PhotoDesc2" runat="server" Text="" Width="100%"
                    TabIndex="6" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                    MaxLength="135">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="grey-text">Image 3 Description</label>
                <dxwdc:ASPxTextBox ID="PhotoDesc3" runat="server" Text="" Width="100%"
                    TabIndex="7" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                    MaxLength="135">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="grey-text">Files</label>
                <dxuc:ASPxUploadControl ID="ASPxUploadControl1" runat="server"
                    FileInputCount="3" Width="100%" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" TabIndex="8">
                </dxuc:ASPxUploadControl>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-4 col-md-offset-5 text-right">
                <asp:LinkButton ID="BTNSaveAdd" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="9">Save and Add Another Issue</asp:LinkButton>
            </div>
            <div class="col-md-3 text-right">
                <asp:LinkButton ID="BTNCancel" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="10">Back to Issue Log</asp:LinkButton>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
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
                                <div class="col-md-12 text-center" style="margin-top: 20px;">
                                    <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center"
                                        Text="Ok" Width="75px">
                                    </dxwdc:ASPxButton>
                                </div>
        </div>
        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                    <headerstyle font-bold="True" font-names="Verdana" font-size="12px" />
        </dxpc:ASPxPopupControl>
            </div>
        </div>
    </form>
</asp:Content>

