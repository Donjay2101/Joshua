<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cxLogin.aspx.vb" Inherits="cxLogin" MasterPageFile="~/MasterPage.master"%>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxwdc" %>
<%@ Register assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<asp:content ID="pageContent" ContentPlaceHolderID="mainContent" runat="server">
          <form id="cxLogin" runat="server">
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160"><img src="graphics/top__01.gif" width="160" height="48" alt="" /></td>
        <td><img src="graphics/top_03.jpg" width="160" height="48" alt="" /></td>
        <td><img src="graphics/top_04.jpg" width="160" height="48" alt="" /></td>
        <td><img src="graphics/top__04.jpg" width="160" height="48" alt="" /></td>
        <td><img src="graphics/top__05.jpg" width="160" height="48" alt="" /></td>
      </tr>
      
      <tr>
        <td><a runat="server" href="cxLogin.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','graphics/hmenu_over_02.gif',1)"><img src="graphics/hmenu_over_02.gif" name="Image5" width="160" height="23" border="0" id="Image5" alt="" /></a></td>
        <td><a runat="server" href="Private/ProjectSelect.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','graphics/hmenu_over_03.gif',1)"><img src="graphics/hmenu_03.gif" name="Image6" width="160" height="23" border="0" id="Image6" alt="" /></a></td>
        <td><a runat="server" href="Private/ProjectSummary.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','graphics/hmenu_over_04.gif',1)"><img src="graphics/hmenu_04.gif" name="Image7" width="160" height="23" border="0" id="Image7" alt="" /></a></td>
        <td><a runat="server" href="Private/IssueLog.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','graphics/hmenu_over_05.gif',1)"><img src="graphics/hmenu_05.gif" name="Image8" width="160" height="23" border="0" id="Image8" alt="" /></a></td>
        <td><a runat="server" href="Help.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','graphics/hmenu_over_06.gif',1)"><img src="graphics/hmenu_06.gif" name="Image9" width="160" height="23" border="0" id="Image9" alt="" /></a></td>
      </tr>
      
      <tr>
        <td valign="top" bgcolor="#FFFFFF">
             
             <table width="160" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="7" colspan="2"><img src="graphics/1pix.gif" height="7" width="160" alt="" /></td>
                </tr>
                
                
                <tr>
                    <td><img src="graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="14" valign="bottom" class="login_text_bold">User not logged in</td>
                </tr>
                <tr>
                    <td><img src="graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="13" valign="top" align="left" class="project_list_reg">&nbsp;</td>
                </tr>
                <tr>
                  <td height="11" colspan="2" valign="top"><img src="graphics/1pix.gif" height="11" width="160" alt="" /></td>
                </tr>
                
                <tr>
                    <td valign="middle" colspan="2" height="14"><img src="graphics/sidebar_dots_03.gif" width="160" height="14" alt="" /></td>
                </tr>
               
                
                <tr>
                    <td valign="top" colspan="2"><a href="http://www.bvhis.com"><img src="graphics/logo_lower_left.gif" width="130" height="127" border="0" alt="" /></a></td>
                </tr>
                <tr>
                    <td height="7" colspan="2" valign="top"></td>
                </tr>
                <tr>
                    <td align="center" valign="top" colspan="2" class="lower_left_services">Civil<br />
                      Structural<br />
                      Mechanical<br />
                      Electrical<br />
                      Commissioning<br />
                      Technology</td>
                </tr>
                <tr>
                  <td height="11" colspan="2" valign="top"><img src="graphics/1pix.gif" height="11" width="160" alt="" /></td>
                </tr>
                <tr>
                    <td valign="middle" colspan="2" height="14"><img src="graphics/sidebar_dots_03.gif" width="160" height="14" alt="" /></td>
                </tr>
                <tr>
                  <td align="center" colspan="2" valign="top"><img src="graphics/cx_logo_03.gif" width="113" height="113" alt="" /></td>
                </tr>
                <tr>
                  <td height="7" colspan="2" valign="top"></td>
                </tr>
                <tr>
                    <td width="7"><img src="graphics/1pix.gif" width="7" alt="" /></td>
                  <td valign="top"><span class="project_list_reg">BVH is a Corporate Member of the <a href="http://www.bcxa.org/certification/index.shtm" target="_blank">Building Commissioning Association</a>. Learn how a Certified Commissioning Professional can benefit your project.<br /></span></td>
                    
                </tr>
            </table>
        </td>
        <td colspan="4" valign="top" bgcolor="#FFFFFF">
            <!-- Begin Content SubTable -->
            <table width="640" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="29"><img src="graphics/1pix.gif" width="29" height="45" alt="" /></td>
                    <td width="109">&nbsp;</td>
                    <td width="19"><img src="graphics/1pix.gif" width="19" height="45" alt="" /></td>
                    <td width="150">&nbsp;</td>  
                    <td width="100">&nbsp;</td>               
                    <td width="214" height="45">&nbsp;</td>
                    <td width="19"><img src="graphics/1pix.gif" width="19" height="45" alt="" /></td>
                </tr>
                <tr>
                    <td width="29">&nbsp;</td>
                    <td width="592" colspan="5"><span class="text_bold">The BVH Commissioning Portal</span><span class="text_reg"> is an on-line tracking database.  The portal is used by the Commissioning Agent to track issues and assign responsibility for corrective action.  All members of the commissioning team will be given access to the Commissioning Portal as required to respond to issues or deficiencies.</span></td>
                    <td width="19">&nbsp;</td>
                </tr>
                <tr>
                    <td height="29"><img src="graphics/1pix.gif" height="29" width="29" alt="" /></td>
                    <td colspan="6"><img src="graphics/1pix.gif" height="29" width="611" alt="" /></td>
                </tr> 
                <tr>
                    <td height="21"><img src="graphics/1pix.gif" height="21" width="29" alt="" /></td>
                    <td colspan="6" class="text_blue_bold">Sign in to BVH Commissioning Portal</td>
                </tr>
                <tr>
                    <td height="11"><img src="graphics/1pix.gif" height="11" width="29" alt="" /></td>
                    <td colspan="6"><img src="graphics/1pix.gif" height="11" width="611" alt="" /></td>
                </tr>                      
                <tr>
                    <td>&nbsp;</td>
                    <td height="24" align="right" class="text_bold">Username</td>
                    <td width="19"><img src="graphics/1pix.gif" width="19" height="24" alt="" /></td>
                    <td valign="middle" colspan="2">
                        <dxwdc:ASPxTextBox ID="InputUsername" runat="server" Height="23px" Width="100%" 
                            TabIndex="1" AutoCompleteType="Email" Font-Names="Verdana" Font-Size="12px" 
                            ForeColor="#666666">
                        </dxwdc:ASPxTextBox>
                    </td>                   
                    <td><dxwdc:ASPxLabel ID="ErrorLabel" runat="server" CssClass="text_reg_red" 
                            TabIndex="0" Width="100%" Visible="False"></dxwdc:ASPxLabel></td>
                    <td>&nbsp;</td>
                </tr>  
                <tr>
                    <td height="11"><img src="graphics/1pix.gif" height="11" width="29" alt="" /></td>
                    <td colspan="6"><img src="graphics/1pix.gif" height="11" width="611" alt="" /></td>
                </tr> 
                <tr>
                    <td>&nbsp;</td>
                    <td height="24" align="right" class="text_bold">Password</td>
                    <td width="19"><img src="graphics/1pix.gif" width="19" height="24" alt="" /></td>
                    <td valign="middle" colspan="2">
                        <dxwdc:ASPxTextBox ID="InputPassword" runat="server" Height="23px" Width="100%" 
                            TabIndex="3" Password="True" Font-Names="Verdana" Font-Size="12px" 
                            ForeColor="#666666">
                        </dxwdc:ASPxTextBox>
                    </td>                   
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td height="11"><img src="graphics/1pix.gif" height="11" width="29" alt="" /></td>
                    <td colspan="6"><img src="graphics/1pix.gif" height="11" width="611" alt="" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td height="21">&nbsp;</td>
                    <td width="19"><img src="graphics/1pix.gif" width="19" height="21" alt="" /></td>
                    <td>&nbsp;</td>
                    <td valign="top" align="right"><asp:LinkButton ID="BTNLogin" runat="server" CssClass="text_bold">Sign In</asp:LinkButton></td>                    
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>     
            </table>
        <!-- End Content SubTable -->
        
        </td>    
      </tr>
      <!-- InstanceBeginEditable name="page_bottom_space" --><tr>
        <td height="7" colspan="5" bgcolor="#FFFFFF"><img src="graphics/1pix.gif" width="800" height="7" alt="" /></td>
      </tr><!-- InstanceEndEditable -->
    </table>


    <dxpc:ASPxPopupControl ID="PopupControl1" runat="server" 
        CloseAction="CloseButton" HeaderText="" Modal="True" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        Text="Invalid Login, Please try again." >
        <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" 
            ForeColor="Red" HorizontalAlign="Center" Wrap="False">
        </ContentStyle>
                <ContentCollection>
<dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">

<table style="border:none">
<tr>
<td><br /></td>
</tr>
<tr>
<td><dxwdc:ASPxButton ID="ASPxButtonOk" runat="server" HorizontalAlign="Center" 
        Text="Ok" Width="75px">
    </dxwdc:ASPxButton></td>
</tr>
</table> 
    
            </dxpc:PopupControlContentControl>
</ContentCollection>
        <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
    </dxpc:ASPxPopupControl>
    </form>
</asp:content>

<%--<body onload="MM_preloadImages('graphics/hmenu_over_02.gif','graphics/hmenu_over_03.gif','graphics/hmenu_over_04.gif','graphics/hmenu_over_05.gif','graphics/hmenu_over_06.gif')">
  
</body>
</html>--%>
