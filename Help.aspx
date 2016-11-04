<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="Public_Help" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxwdc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>BVH Commissioning Portal - Add Issue</title>
    <link href="site_wide.css" rel="stylesheet" type="text/css" />
    
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
<body onload="MM_preloadImages('graphics/hmenu_over_02.gif','graphics/hmenu_over_03.gif','graphics/hmenu_over_04.gif','graphics/hmenu_over_05.gif','graphics/hmenu_over_06.gif')">
    <form id="Help" runat="server">
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="160"><img src="graphics/top_gray.gif" width="160" height="48" alt="" /></td>
        <td><img src="graphics/vtop_01.gif" width="160" height="48" alt="" /></td>
        <td><img src="graphics/stop_01.gif" width="160" height="48" alt="" /></td>
        <td><img src="graphics/stop_02.gif" width="160" height="48" alt="" /></td>
        <td><img src="graphics/ctop_02.gif" width="160" height="48" alt="" /></td>
      </tr>
      
      <tr>
        <td><a runat="server" href="cxLogin.aspx"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','graphics/hmenu_over_02.gif',1)"><img src="graphics/hmenu_02.gif" name="Image5" width="160" height="23" border="0" id="Image5" alt="" /></a></td>
        <td><a runat="server" href="Private/ProjectSelect.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','graphics/hmenu_over_03.gif',1)"><img src="graphics/hmenu_03.gif" name="Image6" width="160" height="23" border="0" id="Image6" alt="" /></a></td>
        <td><a runat="server" href="Private/ProjectSummary.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','graphics/hmenu_over_04.gif',1)"><img src="graphics/hmenu_04.gif" name="Image7" width="160" height="23" border="0" id="Image7" alt="" /></a></td>
        <td><a runat="server" href="Private/IssueLog.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','graphics/hmenu_over_05.gif',1)"><img src="graphics/hmenu_05.gif" name="Image8" width="160" height="23" border="0" id="Image8" alt="" /></a></td>
        <td><a runat="server" href="Help.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','graphics/hmenu_over_06.gif',1)"><img src="graphics/hmenu_over_06.gif" name="Image9" width="160" height="23" border="0" id="Image9" alt="" /></a></td>
      </tr>
      
      <tr>
        <td valign="top" bgcolor="#FFFFFF">
             
             <table width="160" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="7" colspan="2"><img src="graphics/1pix.gif" height="7" width="160" alt="" /></td>
                </tr>
                  <tr>
                    <td><img src="graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="14" valign="bottom" class="login_text_bold"><dxwdc:ASPxLabel ID="LBLCurUser" runat="server" Text="Welcome, Greg Alverson" CssClass="login_text_bold"></dxwdc:ASPxLabel></td>
                </tr>
                <tr>
                    <td><img src="graphics/1pix.gif" width="7" alt="" /></td>
                    <td height="13" valign="top" align="left" class="project_list_reg"><a runat="server" href="cxLogin.aspx" onclick="clearSess" >Sign out</a></td>
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
                    <td width="29" height="45"><img src="graphics/1pix.gif" width="29" height="45" alt="" /></td>
                    <td width="601">&nbsp;</td>
                    <td width="10"><img src="graphics/1pix.gif" width="10" height="45" alt="" /></td>         
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_blue_bold">Help and Support</td>
                    <td></td>         
                </tr>
                <tr>
                    <td colspan="3" height="11"><img src="graphics/1pix.gif" height="11" width="640" alt="" /></td>
                </tr> 
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_bold">User Manual</td>
                    <td>&nbsp;</td>         
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_reg"><ul><li><a href="cxPortal Client User Manual v4.pdf">BVH Cx Portal Client User's Manual v4.0</a></li></ul></td>
                    <td>&nbsp;</td>         
                </tr>
                   
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_bold">Contact Infomation</td>
                    <td>&nbsp;</td>         
                </tr>    
                <tr>
                    <td>&nbsp;</td>
                    <td width="601"><span class="text_reg_blue">Greg Alverson</span><span class="text_reg">
                        <br />
                        IT Department<br />
                        BVH Integrated Services<br />
                        860-286-9171 ex 7478</span></td>
                    <td>&nbsp;</td>         
                </tr>  
                <tr>
                    <td colspan="3" height="19"><img src="graphics/1pix.gif" height="19" width="640" alt="" /></td>
                </tr>         
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_bold">Frequently Asked Questions</td>
                    <td>&nbsp;</td>         
                </tr>           
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_reg"><ul>
                        <li><a href="#1">How do I get a Username and Password?</a></li>
                        <li><a href="#2">I have a Username and Password, How do I Login?</a></li>
                        <li><a href="#3">I already logged in, why do I get logged off automatically?</a></li>
                        <li><a href="#4">I forgot my username and/or password.</a></li>       
                    </ul>          
                    </td>
                    <td>&nbsp;</td>         
                </tr>     
                <tr>
                    <td colspan="3" height="11"><img src="graphics/1pix.gif" height="11" width="640" alt="" /></td>
                </tr>  
                <tr>
                    <td>&nbsp;</td>
                    <td width="601" class="text_reg">
                    
    	                <span class="text_reg_blue"><a name="1"></a>How do I get a Username and Password?</span><br />
    	                To create an account you will need to speak to the commissioning Agent in charge of your project.  He will require details such as your email address, company and role in the project.  A login and password will be emailed to you after speaking with the Commissioning Agent.
		                <div><a href="#top">Back to top</a></div><br />

			            <span class="text_reg_blue"><a name="2"></a>I have a Username and Password, How do I Login?</span><br />
			            You should have received a username and password from your Commissioning Agent. You can then visit the login page and enter your username and password to login. Please remember that the password is case senitive.
			            <div><a href="#top">Back to top</a></div><br />

			            <span class="text_reg_blue"><a name="3"></a>I already logged in, why do I get logged off automatically?</span><br />
			            You will be automatically logged off after an administrator-defined length of inactivity, usually 2 hours. This is a security precaution to prevent anyone else from using your login on a computer you used previous.
			            <div><a href="#top">Back to top</a></div><br />

			            <span class="text_reg_blue"><a name="4"></a>I forgot my username and/or password.</span><br />
                        If you forgot your username and/or password please call our support at BVH and they can provide you with your password or help you obtain a new random password.  Once you receive your username and password you can login.
                        <div><a href="#top">Back to top</a></div><br />
                    </td>
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
    </form>
</body>
</html>


