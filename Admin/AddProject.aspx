<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddProject.aspx.vb" Inherits="AddProject" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content runat="server" ContentPlaceHolderID="mainContent">
    <form id="AddProject" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Add/Edit Project</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Select Project to Edit</label>
            </div>
            <div class="col-md-9">
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
            <div class="col-md-3">
                <label class="grey-text">Project Number:</label>
            </div>
            <div class="col-md-6">
                <dxwdc:ASPxTextBox ID="InputProjectNumber" runat="server" Width="100%"
                    TabIndex="1" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxCheckBox ID="InputProjectClosed" runat="server" Checked="false"
                    CssClass="text_bold" Text="Is Project Closed" TextAlign="Left" Width="100%"
                    Layout="Flow" TabIndex="2">
                </dxwdc:ASPxCheckBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Project Name:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputProjectName" runat="server" Width="100%"
                    TabIndex="3" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Location:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputProjectLocation" runat="server" Width="100%"
                    TabIndex="4" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">BVH Lead CA:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputLeadCA" runat="server" Width="100%" TabIndex="5"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Lead CA Email:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputLeadCAEmail" runat="server" Width="100%"
                    TabIndex="6" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Owner:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputProjectOwner" runat="server" Width="100%"
                    TabIndex="7" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Description:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="InputProjectDescription" runat="server" Width="100%"
                    TabIndex="8" Height="60px" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Commissioning Notice Introduction:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="InputComNoticeIntro" runat="server"
                    Text="Construction Manager is asked to distribute this commissioning notice to all parties for their review and comment. Once the corrections have been made, the commissioning notice shall be returned to BVH indicating all corrections are complete or exceptions have been taken. BVHis will verify their completion of all outstanding items."
                    Width="100%" TabIndex="9" Height="120px" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3 col-md-offset-6 text-right">
                <asp:LinkButton ID="BTNUpdate" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="10">Add/Update Project</asp:LinkButton>
            </div>
            <div class="col-md-3 text-right">
                <asp:LinkButton ID="BTNCancel" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="11">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                  
                                <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" Text="Ok" Width="75px"></dxwdc:ASPxButton>
                        
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:ASPxPopupControl>

    </form>
</asp:Content>
