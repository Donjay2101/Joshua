<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddResponse.aspx.vb" Inherits="AddResponse" MasterPageFile="~/MasterPage-afterLogin.master" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxwdc" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <script>
        function RemoveSession() {
            Session.Contents.Remove("CurProjectID")
            Session.Contents.Remove("CurProjName")
        }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="mainContent" runat="server">
    <form id="AddResponse" runat="server">
        <div class="row form-group">
            <div class="col-md-12">
                <label class="blue-text">Add Response</label>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Project Name:</label>
            </div>
            <div class="col-md-5">
                <dxwdc:ASPxLabel ID="txtProjectName"
                    runat="server" Text="Bridgeport Arena HVAC Modifications" CssClass="text_reg"
                    Width="100%" TabIndex="98">
                </dxwdc:ASPxLabel>
            </div>
            <div class="col-md-2">
                <label class="grey-text">Item No.</label>
            </div>
            <div class="col-md-2">
                <dxwdc:ASPxComboBox ID="ItemNoLookup" runat="server" Width="100%"
                    AutoPostBack="True" EnableIncrementalFiltering="True"
                    ValueType="System.Int32" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" TabIndex="1">
                    <Items>
                        <dxwdc:ListEditItem Text="1" Value="1" />
                    </Items>
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Item Tag:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxLabel ID="txtItemTag" runat="server"
                    CssClass="text_reg" Width="100%" TabIndex="97">
                </dxwdc:ASPxLabel>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Action By:</label>
            </div>
            <div class="col-md-3">
                <dxwdc:ASPxComboBox ID="InputActionBy" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" ValueType="System.Int32"
                    Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" TabIndex="2">
                    <Items>
                        <dxwdc:ListEditItem Text="1" Value="1" />
                    </Items>
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
            <div class="col-md-2">
                <label class="grey-text">Status:</label>
            </div>
            <div class="col-md-4">
                <dxwdc:ASPxComboBox ID="InputStatus" runat="server" Width="100%"
                    EnableIncrementalFiltering="True" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666" TabIndex="3">
                    <ItemStyle>
                        <SelectedStyle ForeColor="White">
                        </SelectedStyle>
                    </ItemStyle>
                </dxwdc:ASPxComboBox>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Description:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="txtItemDesc" runat="server" Height="60px" Width="100%"
                    TabIndex="95" ReadOnly="True" Font-Names="Verdana" Font-Size="12px"
                    ForeColor="#666666">
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">Previous Response:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="txtPreviousResponse" runat="server" TabIndex="96" Width="100%" Height="150px" ReadOnly="True" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"></dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-3">
                <label class="grey-text">New Response:</label>
            </div>
            <div class="col-md-9">
                <dxwdc:ASPxMemo ID="InputResponse" runat="server" TabIndex="4" Width="100%"
                    Height="90px" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                    <ValidationSettings CausesValidation="True" Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dxwdc:ASPxMemo>
            </div>
        </div>
        <div class="row form-group">
            <div class="col-md-offset-6 col-md-3 text-center">
                <asp:LinkButton ID="BTNAdd" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="5">Add Response</asp:LinkButton>
            </div>
            <div class="col-md-3">
                <asp:LinkButton ID="BTNCancel" runat="server" CssClass="text_reg" Width="100%"
                    TabIndex="6">Back to Issue Log</asp:LinkButton>
            </div>
        </div>
        <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue">
            <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <table style="border: none">
                        <tr>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" Text="Ok" Width="75px"></dxwdc:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
        </dxpc:ASPxPopupControl>

    </form>
</asp:Content>


