<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddUser.aspx.vb" Inherits="AddUser" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).on('click', '#createPassword', function () {
          
            PageMethods.GetNewPassowrd(onSucceeded, onFailed);
        });


        function onFailed(error, userContext, methodName) {
            alert('something went wrong please try again after sometime.');
        }

        function onSucceeded(result, userContext, methodName) {
            debugger;
            $('#InputPassword').val(result);
            $('#InputPassVerify').val(result);
        }

        function showSuccessMsg(msg) {
            openPopup(msg);
            $('#popup .banner').css('top', '36%');
            $('#popup .banner').css('width', '24%');
            $('#popup .banner').css('height', '128px');
            $('#popup .middle').css('height', '36px');
            $('#popup .middle').css('width', '20%');

        }

    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" ID="content1" runat="server">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
        rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("[id*=InputEmail]").autocomplete({ source: '<%=ResolveUrl("~/Admin/UserHandler.ashx") %>' });
        });      
    </script>
    <div id="popup" class="header" style="display: none">
    </div>
    <div class="row">
        <div class="col-md-10 col-xs-12 col-sm-12">
              <form id="AddUser" runat="server">
        <asp:ScriptManager ID="ScriptManager1" EnablePageMethods="true" runat="server"></asp:ScriptManager>
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Add/Edit User</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Select User to Edit</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxComboBox ID="UserSelectPulldown" runat="server" Width="100%"
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
                <label class="grey-text">User Email:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputEmail" runat="server" TabIndex="1" Width="100%"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ValidationSettings CausesValidation="True" Display="Dynamic"
                        ErrorText="Invalid Email" SetFocusOnError="True">
                        <RegularExpression ErrorText="Invalid Email"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">First Name:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputFirstName" runat="server" TabIndex="2" Width="100%"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputUserName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Last Name:</label>
            </div>
            <div class="col-md-9">


                <dxwdc:ASPxTextBox ID="InputLastName" runat="server" TabIndex="2" Width="100%"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputUserName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField ErrorText="Required" IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Password:</label>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="InputPassword" ClientIDMode="Static" runat="server" TabIndex="3" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" CssClass="bodered-input"></asp:TextBox>
                <%--<asp:TextBox ID="InputPassword" runat="server" TabIndex="3" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" ></asp:TextBox>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="InputPassword" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <%--<dxwdc:ASPxTextBox ID="InputPassword" runat="server" TabIndex="3" Width="100%"
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" Password="True">
                        </dxwdc:ASPxTextBox>--%>
            </div>
            <div class="col-md-3">
                <a href="#" id="createPassword">Create Password</a>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Verify Password:</label>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="InputPassVerify" runat="server" ClientIDMode="Static" TabIndex="4" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" CssClass="bodered-input"></asp:TextBox>
                <%--<dxwdc:ASPxTextBox ID="InputPassVerify" runat="server" TabIndex="4"
                                Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"
                                Password="True">
                        </dxwdc:ASPxTextBox>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputPassVerify" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="InputPassword" ControlToValidate="InputPassVerify" ErrorMessage="password and confirm password do not match." Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Company:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxComboBox ID="InputCompany" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" ValueType="System.Int32" TabIndex="5"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Phone:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxTextBox ID="InputPhone" runat="server" TabIndex="6" Width="100%"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ValidationSettings Display="Dynamic" ErrorText="Invalid Phone Number"
                        SetFocusOnError="True" CausesValidation="True">
                        <RegularExpression ErrorText="Incorrect format"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                    </ValidationSettings>
                    <MaskSettings Mask="(999) 000-0000" ShowHints="True" />
                </dxwdc:ASPxTextBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <dxwdc:ASPxCheckBox ID="InputUserActive" runat="server" Checked="false"
                    CssClass="text_bold" Text="Account Active" TextAlign="Left" TabIndex="7">
                </dxwdc:ASPxCheckBox>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxCheckBox ID="InputAdmin" runat="server" Checked="false"
                    CssClass="text_bold" Text="Is Administrator" TextAlign="Left"
                    Layout="Flow" TabIndex="8">
                </dxwdc:ASPxCheckBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">User's Role</label>
            </div>
            <%-- ASPxComboBoxRole --%>
            <div class="col-md-9">
                <dxwdc:ASPxComboBox ID="ASPxComboBoxRole" runat="server" Width="100%"
                    AutoPostBack="false" EnableIncrementalFiltering="True"
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
            <div class="col-md-5">
                <asp:LinkButton ID="BTNNewPassword" runat="server" TabIndex="100">Generate New Password for Selected User</asp:LinkButton>
            </div>
            <div class="col-md-3">
                <asp:LinkButton ID="BTNUpdate" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="9">Add/Update User</asp:LinkButton>
            </div>
             <div class="col-md-3">
                <asp:LinkButton ID="LinkButtonDelete" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="10" CausesValidation="False">Delete User</asp:LinkButton>
            </div>
            <div class="col-md-3">
                <asp:LinkButton ID="BTNCancel" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="11" CausesValidation="False">Back to Project Selection</asp:LinkButton>
            </div>
        </div>
        <div id="popControl1" runat="server">
        </div>
        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">              
                     <div class="row">
                                <div class="col-md-12 text-center" style="margin-top:20px;">
                                <%-- <input type="button" value="OK" id="btnOk" /> --%>
                                 <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center"
                                        Text="Ok" Width="75px" AutoPostBack="False" CausesValidation="False">
                                    </dxwdc:ASPxButton>  
                                    </div>
                         </div>                   
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:ASPxPopupControl>
    </form>
        </div>
    </div>
  
</asp:Content>

