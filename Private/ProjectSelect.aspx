<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProjectSelect.aspx.vb" MasterPageFile="~/MasterPage-afterLogin.master" Inherits="ProjectSelect" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent"  runat="server">
            <div class="row">
            <div class="col-md-10 col-xs-12 col-sm-12">
                  <form id="ProjectSelect" runat="server">    
  
        <div class="row form-group">
            <div class="col-md-9 col-sm-12 col-xs-12">
                <label>Please Select a Project:</label>
                <dxwdc:ASPxComboBox ID="ProjectsPulldown" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" ValueType="System.Int32"
                    CssClass="text_reg" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-9 col-sm-12 col-xs-12 text-right">
                <asp:LinkButton ID="BTNProjectSelect" runat="server" CssClass="text_bold">Enter Project</asp:LinkButton>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <dxwdc:ASPxLabel ID="LBLAdmin" runat="server" Text="Administration"></dxwdc:ASPxLabel>
                <ul class="nonbullet selectproject">
                    <li>
                        <asp:LinkButton ID="BTNManageCompanies" runat="server" CssClass="text_reg">Add/Edit Companies</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BTNManageUsers" runat="server" CssClass="text_reg">Add/Edit Users</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BTNManageProjects" runat="server" CssClass="text_reg">Add/Edit Projects</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BTNAssignUsers" runat="server" CssClass="text_reg">Assign Companies to Projects</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BTNRequestAccess" runat="server" CssClass="text_reg">Request Access</asp:LinkButton></li>
                    <li>
                        <asp:LinkButton ID="BTNUsageLog" runat="server" CssClass="text_reg">View cxPortal Usage Log</asp:LinkButton></li>
                </ul>
            </div>
        </div>
        <div class="">
            <dxpc:ASPxPopupControl ID="PopupControl1" runat="server"
                CloseAction="CloseButton" HeaderText="" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                Text="Please Select a Project to Continue">
                <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" HorizontalAlign="Center" Wrap="False">
                </ContentStyle>
                <ContentCollection>
                    <dxpc:PopupControlContentControl runat="server">
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

        </div>
    </form>
            </div>
        </div> 
  
</asp:Content>

