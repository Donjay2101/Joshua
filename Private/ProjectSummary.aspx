<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProjectSummary.aspx.vb" Inherits="ProjectSummary" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<asp:Content ContentPlaceHolderID="mainContent" runat="server">
    <form id="ProjectSummary" runat="server">
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Project:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxLabel ID="LBLProjectName" runat="server" CssClass="text_reg" Height="100%" Width="100%">
                </dxwdc:ASPxLabel>
            </div>
            <div class="col-md-3">
                <label class="grey-text">Owner:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxLabel ID="LBLOwner" runat="server" CssClass="text_reg" Height="100%" Width="100%"></dxwdc:ASPxLabel>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Project Num:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxLabel ID="LBLProjectNumber" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel>
            </div>
            <div class="col-md-3">
                <label class="grey-text">Location:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxLabel ID="LBLProjectLoc" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Lead CA:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxLabel ID="LBLLeadCA" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel>
            </div>
            <div class="col-md-3">
                <label class="grey-text">Lead CA Email:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxHyperLink ID="LBLLeadCAEmail"
                    runat="server" CssClass="text_reg" TabIndex="0" Width="100%">
                </dxwdc:ASPxHyperLink>
            </div>
        </div>

        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Description:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="LBLProjectDesc" runat="server" Height="60px" Width="100%"
                    TabIndex="0" CssClass="text_reg" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <div>
                    <dxwdc:ASPxLabel ID="LBLTotalDef" runat="server"
                        Text="There are 000 total commissioning items." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLTotalOpen" runat="server"
                        Text="There are 000 open commissioning items." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLDefNoResponse"
                        runat="server" Text="There are 000 items not responded to that remain open." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLResponseOpen"
                        runat="server" Text="There are 000 items responded to that remain open." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLPendingVerify" runat="server"
                        Text="There are 000 items pending verification." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLResponseClose" runat="server"
                        Text="There are 000 closed items." CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
                <div>
                    <dxwdc:ASPxLabel ID="LBLDatePosted" runat="server"
                        Text="New Issues have been posted on 00/00/2007" CssClass="text_reg">
                    </dxwdc:ASPxLabel>
                </div>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-offset-3 col-md-3 text-right col-sm-4">
                <asp:LinkButton ID="BTNResponseAdd" runat="server" CssClass="text_reg">Respond to Issues</asp:LinkButton>
            </div>
            <div class="col-md-3 col-sm-4  text-right">
                <asp:LinkButton ID="BTNContacts" runat="server" CssClass="text_reg">View Contact Page</asp:LinkButton>
            </div>
            <div class="col-md-3 col-sm-4  text-right">
                <asp:LinkButton ID="BTNShowIssues" runat="server" CssClass="text_reg">View Issue Log</asp:LinkButton>
            </div>
        </div>
    </form>
</asp:Content>



