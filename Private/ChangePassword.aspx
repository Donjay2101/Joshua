<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="ChangePassword.aspx.vb" Inherits="Private_ChangePassword" %>

<asp:Content ContentPlaceHolderID="mainContent" runat="server" ID="mainContent">
    <form runat="server">
        <div class="row form-group"></div>
 <div class="row">
     <div class="col-md-10 col-md-offset-2">
          <div class="row form-group">
            <div class="col-md-3">
               <label class="grey-text"> Current password:</label>
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtCurrentPassword" runat="server" class="input-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCurrentPassword" ErrorMessage="Required."></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">New password:</label> 
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtNewPassword" runat="server" class="input-text bodered-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Required."></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="grey-text"> Confirm password:</label>
            </div>
            <div class="col-md-8">
                <asp:TextBox ID="txtConfirmPassword" runat="server" class="input-text bodered-input"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="password and confirm password do not match."></asp:CompareValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-offset-3 col-md-8">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" class="new-btn"/>
            </div>
        </div>
     </div>       
</div>
    </form>
   
</asp:Content>