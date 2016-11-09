<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cxLogin.aspx.vb" Inherits="cxLogin" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    <form id="cxLogin" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <span class="text_bold">The BVH Commissioning Portal</span><span class="text_reg"> is an on-line tracking database.  The portal is used by the Commissioning Agent to track issues and assign responsibility for corrective action.  All members of the commissioning team will be given access to the Commissioning Portal as required to respond to issues or deficiencies.</span>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <p class="blue-text">Sign in to BVH Commissioning Portal</p>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-12">
                <div class="row form-group">
                    <label for="inputEmail3" class="col-md-2 control-label">Username</label>
                    <div class="col-md-5">
                        <dxwdc:ASPxTextBox ID="InputUsername" runat="server" Height="23px" Width="100%"
                            TabIndex="1" AutoCompleteType="Email" Font-Names="Verdana" Font-Size="12px"
                            ForeColor="#666666">
                        </dxwdc:ASPxTextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <label for="inputEmail3" class="col-md-2 control-label">Password</label>
                    <div class="col-md-5">
                        <dxwdc:ASPxTextBox ID="InputPassword" runat="server" Height="23px" Width="100%"
                            TabIndex="3" Password="True" Font-Names="Verdana" Font-Size="12px"
                            ForeColor="#666666">
                        </dxwdc:ASPxTextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7 text-right">
                        <asp:LinkButton ID="BTNLogin" runat="server" CssClass="text_bold">Sign In</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>



        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server"
            CloseAction="CloseButton" HeaderText="" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            Text="Invalid Login, Please try again.">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px"
                ForeColor="Red" HorizontalAlign="Center" Wrap="False">
            </ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center"
                        Text="Ok" Width="75px">
                    </dxwdc:ASPxButton>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:ASPxPopupControl>
    </form>
</asp:Content>

<%--<body onload="MM_preloadImages('graphics/hmenu_over_02.gif','graphics/hmenu_over_03.gif','graphics/hmenu_over_04.gif','graphics/hmenu_over_05.gif','graphics/hmenu_over_06.gif')">
  
</body>
</html>--%>
