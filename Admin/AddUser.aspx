<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddUser.aspx.vb" Inherits="AddUser" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxwdc" %>
<%@ Register assembly="DevExpress.Web.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>BVH Commissioning Portal - Add User</title>
    <link href="../site_wide.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/Common.js" type="text/javascript"></script>
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

    //$(document).ready(function () {
    //    alert('hello')
    //});
    //function closePopup()
    //{
    //    document.getElementById('PopupControl1_ASPxButtonOk_CD').parent.hide();
        //}

    //$(document).on('click', '#btnOk', function () {
    //    debugger;
    //    $('#PopupControl1_PW-1').css('display', 'none');
        //});

    //function checkPasswords()
    //{
    //    var pwd=$('#InputPassword').val();
    //    var cPwd = $('#InputPassVerify').val();
    //    if(pwd=='')
    //    {
    //        generateValidation($('#InputPassword'),'Required.');
    //        return false;
    //    }

    //    if(cPwd=='')
    //    {
    //        generateValidation($('#InputPassVerify'), 'Required.');
    //        return false;
    //    }

    //    if(cPwd!=pwd)
    //    {
    //        generateValidation($('#InputPassVerify') , 'password and confirm password do not match.');
    //        return false;
    //    }

    //    return true;
        

    //}


    //$(document).on('change','#InputPassVerify', function () {
    //    if ($(this).val() != '')
    //    {
    //        $(this).parent().find('table').remove();
    //    }
    //    else
    //    {
    //        generateValidation($('#InputPassVerify'));
            
    //    }
    //});

    //$(document).on('change', '#InputPassword', function () {
    //    if ($(this).val() != '') {
    //        $(this).parent().find('table').remove();
    //    }
    //    else
    //    {
    //        generateValidation($('#InputPassword'));
    //    }
    //});


    $(document).on('click', '#createPassword', function () {
        $.ajax({            
            url: "/Admin/AddUser.aspx/GetNewPassowrd",
            dataType: "json",
        success: function (d) {
            $('#InputPassword').val(d);
            $('#InputPassVerify').val(d);
        },
        failure: function(response) {
            alert(response.d);
        }
            

        });
    });
    </script>

</head>

<body onload="MM_preloadImages('../graphics/hmenu_over_02.gif','../graphics/hmenu_over_03.gif','../graphics/hmenu_over_04.gif','../graphics/hmenu_over_05.gif','../graphics/hmenu_over_06.gif')">
    <form id="AddUser" runat="server">
        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="160"><img src="../graphics/top_gray.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/top_02.gif" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/top_03.jpg" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/top_04.jpg" width="160" height="48" alt="" /></td>
            <td><img src="../graphics/top_05.jpg" width="160" height="48" alt="" /></td>
          </tr>
          
          <tr>
            <td><a runat="server" href="../cxLogin.aspx" onclick="clearSess" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','../graphics/hmenu_over_02.gif',1)"><img src="../graphics/hmenu_02.gif" name="Image5" width="160" height="23" border="0" id="Image5" alt="" /></a></td>
            <td><a runat="server" href="../Private/ProjectSelect.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','../graphics/hmenu_over_03.gif',1)"><img src="../graphics/hmenu_over_03.gif" name="Image6" width="160" height="23" border="0" id="Image6" alt="" /></a></td>
            <td><a runat="server" href="../Private/ProjectSummary.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','../graphics/hmenu_over_04.gif',1)"><img src="../graphics/hmenu_04.gif" name="Image7" width="160" height="23" border="0" id="Image7" alt="" /></a></td>
            <td><a runat="server" href="../Private/IssueLog.aspx" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','../graphics/hmenu_over_05.gif',1)"><img src="../graphics/hmenu_05.gif" name="Image8" width="160" height="23" border="0" id="Image8" alt="" /></a></td>
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
                        <td height="13" valign="top" align="left" class="project_list_reg"><a runat="server" href="../cxLogin.aspx" onclick="clearSess">Sign out</a></td>
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
                      <td valign="top"><span class="project_list_reg">BVH is a Corporate Member of the <a href="http://www.bcxa.org/certification/index.shtm" target="_blank">Building Commissioning Association</a>. Learn how a Certified Commissioning Professional can benefit your project.<br /></span></td>
                        
                    </tr>
                </table>
            </td>
            <td colspan="4" valign="top" bgcolor="#FFFFFF">
             <!-- Begin Content SubTable -->
                <table width="640" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
                    <tr>
                        <td width="29" height="45"><img src="../graphics/1pix.gif" width="29" height="45" alt="" /></td>
                        <td width="130">&nbsp;</td>
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="45" alt="" /></td>
                        <td width="351">&nbsp;</td>
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="45" alt="" /></td>
                        <td width="100">&nbsp;</td> 
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="45" alt="" /></td>          
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td align="left" colspan="5" class="text_blue_bold">Add/Edit User</td>
                        <td>&nbsp;</td>        
                    </tr>
                    <tr>
                        <td colspan="7" height="19"><img src="../graphics/1pix.gif" height="19" width="640" alt="" /></td>
                    </tr>      
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Select User to Edit</td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_reg">
                            <dxwdc:ASPxComboBox ID="UserSelectPulldown" runat="server" Width="100%" 
                                AutoPostBack="True" EnableIncrementalFiltering="True" 
                                ValueType="System.Int32" Font-Names="Verdana" Font-Size="12px" 
                                ForeColor="#666666">
                                <ItemStyle>
                                <SelectedStyle ForeColor="White">
                                </SelectedStyle>
                                </ItemStyle>
                            </dxwdc:ASPxComboBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr>
                    <tr>
                        <td width="29" height="29"><img src="../graphics/1pix.gif" width="29" height="29" alt="" /></td> 
                        <td width="601" height="29" colspan="5"><hr align="center" width="601" size="1"/></td>
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="29" alt="" /></td> 
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">User Email:</td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_reg">
                            <dxwdc:ASPxTextBox ID="InputEmail" runat="server" TabIndex="1" Width="100%" 
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                                <ValidationSettings CausesValidation="True" Display="Dynamic" 
                                    ErrorText="Invalid Email" SetFocusOnError="True">
                                    <RegularExpression ErrorText="Invalid Email" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                </ValidationSettings>
                            </dxwdc:ASPxTextBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr>   
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Full Name:</td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_reg">
                            <%--<asp:TextBox ID="InputUserName" runat="server" TabIndex="2" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"></asp:TextBox>--%>
                            <dxwdc:ASPxTextBox ID="InputUserName" runat="server" TabIndex="2" Width="100%" 
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputUserName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>--%>
                                <ValidationSettings CausesValidation="True" Display="Dynamic">
                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                </ValidationSettings>
                            </dxwdc:ASPxTextBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr>  
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Password:</td>
                        <td>&nbsp;</td> 
                        <td width="351" class="text_reg">
                            <asp:TextBox ID="InputPassword" runat="server" TabIndex="3" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"></asp:TextBox>
                            <%--<asp:TextBox ID="InputPassword" runat="server" TabIndex="3" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" ></asp:TextBox>--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="InputPassword" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                            <%--<dxwdc:ASPxTextBox ID="InputPassword" runat="server" TabIndex="3" Width="100%" 
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" Password="True">
                        </dxwdc:ASPxTextBox>--%>
                        </td>
                        <td>&nbsp;</td>   
                        <td width="100" rowspan="3" valign="middle" align="center" class="text_reg">
                           <a href="#" id="createPassword">Create Password</a>

                             <%--<asp:LinkButton ID="BTNCreatePassword" runat="server" CssClass="text_reg" 
                                Height="100%" Width="100%" Enabled="False" TabIndex="99">Create Password</asp:LinkButton></td>--%>
                        <td>&nbsp;</td>      
                    </tr>  
                    <tr>
                        <td colspan="5" width="530" height="11"><img src="../graphics/1pix.gif" width="530" height="11" alt="" /></td>
                        <td width="10"><img src="../graphics/1pix.gif" width="10" height="11" alt="" /></td>    
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Verify Password:</td>
                        <td>&nbsp;</td> 
                        <td width="351" class="text_reg">
                            <asp:TextBox ID="InputPassVerify" runat="server"  TabIndex="4" Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666"></asp:TextBox>
                            <%--<dxwdc:ASPxTextBox ID="InputPassVerify" runat="server" TabIndex="4" 
                                Width="100%" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" 
                                Password="True">
                        </dxwdc:ASPxTextBox>--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="InputPassVerify" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>    
                        <td>&nbsp;</td>                              
                    </tr>  
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Company:</td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_reg">
                            <dxwdc:ASPxComboBox ID="InputCompany" runat="server" Width="100%" 
                                EnableIncrementalFiltering="True" ValueType="System.Int32" TabIndex="5" 
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                                <ItemStyle>
                                <SelectedStyle ForeColor="White">
                                </SelectedStyle>
                                </ItemStyle>
                            </dxwdc:ASPxComboBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr>  
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td class="text_bold">Phone:</td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_reg">
                            <dxwdc:ASPxTextBox ID="InputPhone" runat="server" TabIndex="6" Width="100%" 
                                Font-Names="Verdana" Font-Size="12px" ForeColor="#666666">
                                <ValidationSettings Display="Dynamic" ErrorText="Invalid Phone Number" 
                                    SetFocusOnError="True" CausesValidation="True">
                                    <RegularExpression ErrorText="Incorrect format" 
                                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
                                </ValidationSettings>
                                <MaskSettings Mask="(999) 000-0000" ShowHints="True" />
                            </dxwdc:ASPxTextBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr>                     
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>    
                    <tr>
                        <td>&nbsp;</td>
                        <td width="130" class="text_bold">
                            <dxwdc:ASPxCheckBox ID="InputUserActive" runat="server" Checked="false" 
                                CssClass="text_bold" Text="Account Active" TextAlign="Left" TabIndex="7" >
                            </dxwdc:ASPxCheckBox>
                        </td>
                        <td>&nbsp;</td> 
                        <td width="461" colspan="3" class="text_bold">
                            <dxwdc:ASPxCheckBox ID="InputAdmin" runat="server" Checked="false" 
                                CssClass="text_bold" Text="Is Administrator" TextAlign="Left" 
                                Layout="Flow" TabIndex="8">
                            </dxwdc:ASPxCheckBox>
                        </td>
                        <td>&nbsp;</td>        
                    </tr> 
                    <tr>
                        <td colspan="7" height="11"><img src="../graphics/1pix.gif" height="11" width="640" alt="" /></td>
                    </tr>     
                    <tr>
                        <td colspan="7">
                            <table width="640" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
                                <tr>
                                    <td width="29" height="29"><img src="../graphics/1pix.gif" width="29" height="29" alt="" /></td>
                                    <td width="301" valign="middle" align="left" class="text_reg">
                                        <asp:LinkButton ID="BTNNewPassword" runat="server" TabIndex="100">Generate New Password for Selected User</asp:LinkButton></td>
                                    <td width="115" valign="middle" align="right" class="text_reg">
                                        <asp:LinkButton ID="BTNUpdate" runat="server" CssClass="text_reg" Width="100%" 
                                            TabIndex="9">Add/Update User</asp:LinkButton></td>
                                    <td width="20"><img src="../graphics/1pix.gif" width="20" height="29" alt="" /></td>
                                    <td width="165" valign="middle" align="right" class="text_reg">
                                        <asp:LinkButton ID="BTNCancel" runat="server" CssClass="text_reg" Width="100%" 
                                            TabIndex="10">Back to Project Selection</asp:LinkButton></td>
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
        
        <div id="popControl1" runat="server">
                
        </div>
<dxpc:ASPxPopupControl ID="PopupControl1" runat="server" CloseAction="CloseButton" HeaderText="" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Text="Please Select a Project to Continue" >
    <ContentStyle Font-Bold="False" Font-Names="Verdana" Font-Size="12px" ForeColor="#666666" HorizontalAlign="Center" Wrap="True"></ContentStyle>
    <ContentCollection>
        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <table style="border:none">
                    <tr>
                       <td><br /></td>
                    </tr>
                    <tr>

                        <td>
                           <%-- <input type="button" value="OK" id="btnOk" /> --%>
                            <asp:Button ID="ASPxButtonOk"  runat="server" Text="Ok" HorizontalAlign="Center" />
                            <%--<dxwdc:ASPxButton ID="ASPxButtonOk" OnClick="ASPxButtonOk_Click" runat="server" HorizontalAlign="Center" Text="Ok" Width="75px"></dxwdc:ASPxButton></td>--%>
                    </tr>
                </table> 
                    </dxpc:PopupControlContentControl>
    </ContentCollection>
    <HeaderStyle Font-Bold="True" Font-Names="Verdana" Font-Size="12px" />
</dxpc:ASPxPopupControl>
       

    </form>
</body>
</html>

