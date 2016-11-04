<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProjectSummary.aspx.vb" Inherits="ProjectSummary" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxwdc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>BVH Commissioning Portal - Project Summary</title>
    <link href="../site_wide.css" rel="stylesheet" type="text/css" />
    
    <script type="text/JavaScript">
    <!--
    function MM_swapImgRestore() { //v3.0
      var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }

    function MM_preloadImages() { //v3.0
      var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
        var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
        if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
    }

    function MM_findObj(n, d) { //v4.01
      var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
      if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
      for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
      if(!x && d.getElementById) x=d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
      var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
       if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
    }
    //-->
    </script>

</head>

<body onload="MM_preloadImages('../graphics/hmenu_over_02.gif','../graphics/hmenu_over_03.gif','../graphics/hmenu_over_04.gif','../graphics/hmenu_over_05.gif','../graphics/hmenu_over_06.gif')">
    <form id="ProjectSummary" runat="server">

    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160"><img src="../graphics/stop_01.gif" width="160" height="48" alt="" /></td>
        <td><img src="../graphics/stop_02.gif" width="160" height="48" alt="" /></td>
        <td><img src="../graphics/stop_03.gif" width="160" height="48" alt="" /></td>
        <td><img src="../graphics/top_gray.gif" width="160" height="48" alt="" /></td>
        <td><img src="../graphics/top__05.jpg" width="160" height="48" alt="" /></td>
      </tr>
      
      <tr>
        <td><a runat="server" href="../cxLogin.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','../graphics/hmenu_over_02.gif',1)"><img src="../graphics/hmenu_02.gif" name="Image5" width="160" height="23" border="0" id="Image5" alt="" /></a></td>
        <td><a runat="server" href="ProjectSelect.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','../graphics/hmenu_over_03.gif',1)"><img src="../graphics/hmenu_03.gif" name="Image6" width="160" height="23" border="0" id="Image6" alt="" /></a></td>
        <td><a runat="server" href="ProjectSummary.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','../graphics/hmenu_over_04.gif',1)"><img src="../graphics/hmenu_over_04.gif" name="Image7" width="160" height="23" border="0" id="Image7" alt="" /></a></td>
        <td><a runat="server" href="IssueLog.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','../graphics/hmenu_over_05.gif',1)"><img src="../graphics/hmenu_05.gif" name="Image8" width="160" height="23" border="0" id="Image8" alt="" /></a></td>
        <td><a runat="server" href="../Help.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','../graphics/hmenu_over_06.gif',1)"><img src="../graphics/hmenu_06.gif" name="Image9" width="160" height="23" border="0" id="Image9" alt="" /></a></td>
      </tr>
      
      <tr>
        <td valign="top" bgcolor="#FFFFFF">
             
             <table width="160" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="7" colspan="2"><img src="../graphics/1pix.gif" height="7" width="160" alt="" /></td>
                </tr>
                  <tr>
                    <td><img src="../graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="14" valign="bottom" class="login_text_bold"><dxwdc:ASPxLabel ID="LBLCurUser" runat="server" Text="Welcome, Greg Alverson" CssClass="login_text_bold"></dxwdc:ASPxLabel></td>
                </tr>
                <tr>
                    <td><img src="../graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="13" valign="top" align="left" class="project_list_reg"><a runat="server" href="../cxLogin.aspx" >Sign out</a></td>
                </tr>
                 <tr>
                  <td height="11" colspan="2" valign="top"><img src="../graphics/1pix.gif" height="11" width="160" alt="" /></td>
                </tr>
                
                <tr>
                    <td valign="middle" colspan="2" height="14"><img src="../graphics/sidebar_dots_03.gif" width="160" height="14" alt="" /></td>
                </tr>
                <tr>
                    <td valign="top" colspan="2"><a href="http://www.bvhis.com"><img src="../graphics/logo_lower_left.gif" width="130" height="127" border="0" alt="" /></a></td>
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
                  <td height="11" colspan="2" valign="top"><img src="../graphics/1pix.gif" height="11" width="160" alt="" /></td>
                </tr>
                <tr>
                    <td valign="middle" colspan="2" height="14"><img src="../graphics/sidebar_dots_03.gif" width="160" height="14" alt="" /></td>
                </tr>
                <tr>
                  <td align="center" colspan="2" valign="top"><img src="../graphics/cx_logo_03.gif" width="113" height="113" alt="" /></td>
                </tr>
                <tr>
                  <td height="7" colspan="2" valign="top"></td>
                </tr>
                <tr>
                    <td width="7"><img src="../graphics/1pix.gif" width="7" alt="" /></td>
                  <td valign="top"><span class="project_list_reg">BVH is a Corporate Member of the <a href="http://www.bcxa.org/certification/index.shtm" target="_blank">Building Commissioning Association</a>. Learn how a Certified Commissioning Professional can benefit your project.</span></td>
                </tr>
            </table>
        </td>
        <td colspan="4" valign="top" bgcolor="#FFFFFF">
        <!-- Begin Content SubTable -->    
            <table width="640" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="29" height="45">&nbsp;</td>
                    <td width="95">&nbsp;</td>
                    <td width="226">&nbsp;</td>
                    <td width="10"><img src="../graphics/1pix.gif" width="10" height="45" alt="" /></td>
                    <td width="105">&nbsp;</td>
                    <td width="165">&nbsp;</td>
                    <td width="10"><img src="../graphics/1pix.gif" width="10" height="45" alt="" /></td>          
                </tr>
                 <tr>
                    <td height="42"><img src="../graphics/1pix.gif" height="42" width="29" alt="" /></td>
                    <td valign="top" class="text_bold">Project:</td><!-- &nbsp; -->
                    <td valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLProjectName" runat="server" CssClass="text_reg" Height="100%" Width="100%">
                        </dxwdc:ASPxLabel>
                    </td>
                    <td><img src="../graphics/1pix.gif" width="10" height="42" alt="" /></td>
                    <td valign="top" class="text_bold">Owner:</td>
                    <td valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLOwner" runat="server" CssClass="text_reg" Height="100%" Width="100%"></dxwdc:ASPxLabel></td>
                    <td><img src="../graphics/1pix.gif" width="10" height="42" alt="" /></td>
                 </tr>
                 <tr>
                    <td><img src="../graphics/1pix.gif" height="29" width="29" alt="" /></td>
                    <td valign="top" class="text_bold">Project Num:</td>
                    <td valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLProjectNumber" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel></td>
                    <td><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                    <td valign="top" class="text_bold">Location:</td>
                    <td valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLProjectLoc" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel></td>
                    <td><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                 </tr>
                 <tr>
                    <td height="29"><img src="../graphics/1pix.gif" height="29" width="29" alt="" /></td>
                    <td valign="top" class="text_bold">Lead CA:</td>
                    <td valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLLeadCA" runat="server" CssClass="text_reg" Width="100%"></dxwdc:ASPxLabel></td>
                    <td><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                    <td valign="top" class="text_bold">Lead CA Email:</td>
                    <td valign="top" class="text_reg"><dxwdc:ASPxHyperLink ID="LBLLeadCAEmail"
                            runat="server" CssClass="text_reg" TabIndex="0" Width="100%">
                        </dxwdc:ASPxHyperLink>
                    </td>
                    <td><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                 </tr>
                 <tr>
                    <td height="60"><img src="../graphics/1pix.gif" height="60" width="29" alt="" /></td>
                    <td width="95" height="60" valign="top" class="text_bold">Description:</td>
                    <td colspan="4" width="506" height="60" class="text_reg">
                        <dxwdc:ASPxMemo ID="LBLProjectDesc" runat="server" Height="60px" Width="100%" 
                            TabIndex="0" CssClass="text_reg" Font-Names="Verdana" Font-Size="12px" 
                            ForeColor="#666666">
                        </dxwdc:ASPxMemo>
                    </td>        
                    <td width="10" height="60"><img src="../graphics/1pix.gif" width="10" height="60" alt="" /></td>
                 </tr> 
                 <tr>
                    <td height="10" colspan="7"><img src="../graphics/1pix.gif" height="10"  width="640" alt="" /></td>
                 </tr>         
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLTotalDef" runat="server"
                                Text="There are 000 total commissioning items." CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLTotalOpen" runat="server"
                                Text="There are 000 open commissioning items." CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLDefNoResponse"
                                runat="server" Text="There are 000 items not responded to that remain open." CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLResponseOpen"
                                runat="server" Text="There are 000 items responded to that remain open." CssClass="text_reg"></dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLPendingVerify" runat="server"
                                Text="There are 000 items pending verification." CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLResponseClose" runat="server"
                                Text="There are 000 closed items." CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td>&nbsp;</td>
                    <td colspan="5" valign="top" class="text_reg"><dxwdc:ASPxLabel ID="LBLDatePosted" runat="server"
                                Text="New Issues have been posted on 00/00/2007" CssClass="text_reg">
                            </dxwdc:ASPxLabel>
                        </td>        
                    <td>&nbsp;</td>
                 </tr>
                 <tr>
                    <td height="10" colspan="7"><img src="../graphics/1pix.gif" height="10" width="640" alt="" /></td>
                 </tr>      
                <tr>
                    <td colspan="7" height="29"><!-- begin new table for bottom links-->
                        <table width="640" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="29" height="29"><img src="../graphics/1pix.gif" width="29" height="29" alt="" /></td>
                            <td width="211">&nbsp;</td>
                            <td width="125" valign="middle" align="right" class="text_reg"><asp:LinkButton ID="BTNResponseAdd" runat="server" CssClass="text_reg">Respond to Issues</asp:LinkButton></td>
                            <td width="20"><img src="../graphics/1pix.gif" width="20" height="29" alt="" /></td>
                            <td width="125" valign="middle" align="right" class="text_reg"><asp:LinkButton ID="BTNContacts" runat="server" CssClass="text_reg">View Contact Page</asp:LinkButton></td>
                            <td width="20"><img src="../graphics/1pix.gif" width="20" height="29" alt="" /></td>
                            <td width="100" valign="middle" align="right" class="text_reg"><asp:LinkButton ID="BTNShowIssues" runat="server" CssClass="text_reg">View Issue Log</asp:LinkButton></td>
                            <td width="10"><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td>
                        </tr>            
                        </table>           
                    </td>
                </tr>
            </table>    
        
        <!-- End Content SubTable -->
        </td>
      </tr>
      <!-- InstanceBeginEditable name="page_bottom_space" --><tr>
        <td height="7" colspan="5" bgcolor="#FFFFFF"><img src="../graphics/1pix.gif" width="800" height="7" alt="" /></td>
      </tr><!-- InstanceEndEditable -->
    </table>

    </form>
</body>
</html>

