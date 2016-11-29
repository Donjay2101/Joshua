<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cxLogin.aspx.vb" Inherits="cxLogin" MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<asp:Content runat="server" ContentPlaceHolderID="head" ID="head">
<script>
    $(document).on('click', '#forgotpassword', function () {
        $('#divForgotpassword').css('display', 'block');
    });
    $(document).on('click', '#btnSendEmail1', function () {
        debugger;
        var email=$('#txtEmailBox').val();

        $.ajax({
            url: '/cxLogin.aspx/SendEmail?email=' + email,
            type: "GET",
            contentType: "Application/JSON;charset=utf-8",
            success: function (data) {
                alert('password  updated successfully, new password has been sent to your registered email.');
            },
            error: function (err) {
                alert(err.statusText);
            }            
        });
        //PageMethods.SendEmail(email);
        
    });
</script>
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    
    <form id="cxLogin" runat="server">
    <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
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
                <div class="row" >
                    <div class="col-md-7 text-right">
                        <asp:Button ID="BTNLogin" runat="server" Text="Sign In" OnClick="BTNLogin_Click" CssClass="new-btn"/>
                        <%--<asp:LinkButton ID="BTNLogin" OnClick="BTNLogin_Click" runat="server" CssClass="text_bold">Sign In</asp:LinkButton>--%>
                        <a href="#" id="forgotpassword">Forgot password?</a>                        
                    </div>
                </div>
                <div class="row" id="divForgotpassword" style="display:none">
                    <div class="col-md-4">
                        Email:
                    </div>
                    <div>
                        <asp:TextBox ID="txtEmailBox" ClientIDMode="Static"  runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="entered is not an email." ControlToValidate="txtEmailBox" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <%--<input type="button" id="btnSendEmail" value="submit"name="submit"/>--%>
                        <asp:Button ID="btnSendEmail" runat="server" Text="submit" />

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
