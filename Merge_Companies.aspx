<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Merge_Companies.aspx.vb" Inherits="Merge_Companies" MasterPageFile="~/MasterPage.master" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<asp:Content runat="server" ContentPlaceHolderID="head" ID="head">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="frm" runat="server">
        <table style="border: 10px solid double">
            <tr>
                <th>List of Companies</th>
                <th>Sigle Company</th>
            </tr>
            <tr>
                <td>
                    <div style="OVERFLOW-Y:scroll; WIDTH:250px; HEIGHT:400px">
                    <asp:CheckBoxList ID="listCompany" runat="server" Height="50"></asp:CheckBoxList>
                        </div>
                </td>
                <td>
                    <asp:DropDownList ID="oneCompany" runat="server"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <div class="row">
            <div class="col-md-3 col-md-offset-6 col-sm-6 text-right">
                <asp:LinkButton ID="BTNUpdate" runat="server" Width="100%" CssClass="text_reg"
                    TabIndex="4">Merge Companies</asp:LinkButton>
            
            </div>
            <div class="col-md-3 col-sm-6 text-right">
                    <asp:LinkButton ID="BTNCancel" runat="server" Width="100%" CssClass="text_reg">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <dxpc:aspxpopupcontrol ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                  
                                <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" Text="Ok" Width="75px"></dxwdc:ASPxButton>
                        
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:aspxpopupcontrol>
    </form>
</asp:Content>
