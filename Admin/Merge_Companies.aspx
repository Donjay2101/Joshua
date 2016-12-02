<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Merge_Companies.aspx.vb" Inherits="Merge_Companies" MasterPageFile="~/MasterPage-afterLogin.master" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<asp:Content runat="server" ContentPlaceHolderID="head" ID="head">
</asp:Content>
<asp:Content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
      <div class="col-md-12 col-xs-12 col-sm-12">
            <form id="frm" runat="server">
                           <div class="row form-group">
                    <div class="col-md-12">
                        <label class="blue-text">Merge Companies</label>
                    </div>
                </div>
     <div class="row form-group">
         <div class="col-md-4 col-sm-6 col-xs-12">
               <label class="grey-text">Merge From</label>
              <div style="OVERFLOW-Y: scroll;
    WIDTH:100%;
    HEIGHT: 250px;
    border: 1px solid #cacaca;
    border-radius: 2px;
    padding: 8px;">
                    <asp:CheckBoxList ID="listCompany" runat="server" Height="50"></asp:CheckBoxList>
                    </div>
         </div>
          <div class="col-md-4 col-sm-6 col-xs-12">
                 <label class="grey-text">Merge To</label>
               <asp:DropDownList ID="oneCompany" runat="server" style="width: 100%;"></asp:DropDownList>
         </div>
     </div>
              
          
                   
         
                   
     
        <div class="row">
            <div class="col-md-3 col-md-offset-6 col-sm-6 text-right">
                <asp:LinkButton ID="BTNUpdate" runat="server" Width="100%" CssClass="text_reg"
                    TabIndex="4">Merge Companies</asp:LinkButton>
            
            </div>
            <div class="col-md-3 col-sm-6">
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
        </div>
    </div>
  
</asp:Content>
