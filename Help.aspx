<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Help.aspx.vb" Inherits="Public_Help" MasterPageFile="~/MasterPage.master"%>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxwdc" %>
<asp:Content ContentPlaceHolderID="mainContent" runat="server">
    <form id="Help" runat="server">
             <div class="row form-group">
                 <div class="col-lg-12">
                     <label class="blue-text">Help and Support</label>
                 </div>
             </div>
         <div class="row form-group">
                 <div class="col-lg-12">
                     <label class="grey-text">User Manual</label>
                     <ul>
                        <li><a href="cxPortal Client User Manual v4.pdf">BVH Cx Portal Client User's Manual v4.0</a></li>
                     </ul>
                 </div>
             </div>
          <div class="row form-group">
                 <div class="col-lg-12">
                     <label class="grey-text">Contact Infomation</label>
                     <ul class="nonbullet">
                         <li class="blue">Greg Alverson</li>
                         <li>  IT Department</li>
                         <li>  BVH Integrated Services</li>
                         <li>  860-286-9171 ex 7478</li>
                     </ul>
                 </div>
             </div>
          <div class="row form-group">
                 <div class="col-lg-12">
                     <label class="grey-text">Frequently Asked Questions</label>
                     <ul>
                        <li><a href="#1" class="blue">How do I get a Username and Password?</a></li>
                        <li><a href="#2" class="blue">I have a Username and Password, How do I Login?</a></li>
                        <li><a href="#3" class="blue">I already logged in, why do I get logged off automatically?</a></li>
                        <li><a href="#4" class="blue">I forgot my username and/or password.</a></li>
                     </ul>
                 </div>
             </div>
        <div class="row form-group">
                 <div class="col-lg-12">
                      
                        <span class="text_reg_blue"><a name="1"></a>How do I get a Username and Password?</span>
                        <p>
                            To create an account you will need to speak to the commissioning Agent in charge of your project. 
                             He will require details such as your email address, company and role in the project.  
                            A login and password will be emailed to you after speaking with the Commissioning Agent.<br />
                             <a href="#top" class="text_reg_blue blue">Back to top</a>
                        </p>                               
                        <span class="text_reg_blue"><a name="1"></a>I have a Username and Password, How do I Login?</span>
                        <p>
                            You should have received a username and password from your Commissioning Agent.
                             You can then visit the login page and enter your username and password to login.
                             Please remember that the password is case senitive.<br />
                            <a href="#top" class="text_reg_blue blue">Back to top</a>
                        </p>
                       
                      <span class="text_reg_blue"><a name="1"></a>I already logged in, why do I get logged off automatically?</span>
                        <p>
                             You will be automatically logged off after an administrator-defined length of inactivity, 
                            usually 2 hours. This is a security precaution to prevent anyone else from using your 
                            login on a computer you used previous.<br />
                             <a href="#top" class="text_reg_blue blue">Back to top</a>
                        </p>
                      
                      <span class="text_reg_blue"><a name="1"></a>I forgot my username and/or password.</span>
                        <p>
                              If you forgot your username and/or password please call our support at BVH 
                            and they can provide you with your password or help you obtain a new random password. 
                             Once you receive your username and password you can login.<br />
                             <a href="#top" class="text_reg_blue blue">Back to top</a>
                        </p>
                      
                 </div>
             </div>
    </form>
</asp:Content>

