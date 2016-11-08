<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="ChangePassword.aspx.vb" Inherits="Private_ChangePassword" %>

<asp:Content ContentPlaceHolderID="mainContent" runat="server" ID="mainContent">
    <form runat="server">
 <div class="row">
        <div class="row">
            <div class="col-md-4">
                Current password:
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtCurrentPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Required."></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                New password:
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Required."></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                Confirm password:
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="password and confirm password do not match."></asp:CompareValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
    </form>
   
</asp:Content>