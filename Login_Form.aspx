<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login_Form.aspx.cs" Inherits="Login_Form" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            width: auto;
            height: auto;
        }
        .modalBackground1 {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.6;
        }

        .modalPopup1 {
            /*background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;*/
            width: auto;
            height: auto;
        }
        .btn1 {
          background: linear-gradient(to bottom, #f15a23, #f15a23) repeat scroll 0 0 #f15a23;
    border: 2px solid #f15a23;
            border-radius: 6px;
            color: #ffffff;
            font-family: Arial;
            font-size: 16px;
            margin-left: 14px;
            margin-top: 18px;
            padding: 2px 11px;
            text-decoration: none;
        }

            .btn1:hover {
                background: #f15a23;
                background-image: -webkit-linear-gradient(top, #f15a23, #f15a23);
                background-image: -moz-linear-gradient(top, #f15a23, #f15a23);
                background-image: -ms-linear-gradient(top, #f15a23, #f15a23);
                background-image: -o-linear-gradient(top, #f15a23, #f15a23);
                background-image: linear-gradient(to bottom, #f15a23, #f15a23);
                text-decoration: none;
                color: #fff;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content">

        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a><a style="color: #333333; font-size: 12px;"> » </a><a style="color: #333333; font-size: 12px;" href="#">Account</a><a style="color: #333333; font-size: 12px;"> » </a><a style="color: #333333; font-size: 12px;" href="#">Login</a> </div>
        <!--Breadcrumb Part End-->
        <h1>Account Login</h1>
        <div class="login-content">
            <div class="left">
                <h2>New Customer</h2>
                <div class="content">
                    <p><b>Register Account</b></p>
                    <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
                    <asp:LinkButton ID="LinkButton1" runat="server" class="button" OnClick="btn_continue_Click">Continue</asp:LinkButton>
                </div>
            </div>
            <asp:HiddenField ID="hdnField" runat="server" />
            <cc1:ModalPopupExtender ID="activation_modal" runat="server" PopupControlID="Panel2" TargetControlID="hdnField"
                 BackgroundCssClass="modalBackground1">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup1" Style="display: none">
               <div style="width:100%;">
                    <div style="background-color: #F15A23; font-size: 15px; float:left; font-weight: 700; color: white; height: 15px; padding: 10px; width:100%;">Welcome HighChoices<span style="float:right;"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image/close.png" Height="10" OnClick="ImageButton1_Click"/></span></div>
              
                   </div>
               <div style="background-color:white; width:100%; font-size:15px; font-weight:700; padding:10px; float:left;">
                   Congratulations Your Account Successfully Activated
               </div>
            </asp:Panel>
            <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
                CancelControlID="btnClose" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>

            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
                <div>
                    <div style="background-color: #F15A23; font-size: 15px; font-weight: 700; color: white; height: 20px; padding: 10px;">Forgot Password</div>

                    <div style=" margin-left: -56px;
    margin-top: 26px;
    padding-left: 94px;
    padding-right: 47px;">
                        <asp:Label ID="Label1" runat="server" Text="Enter Your Email ID :" CssClass="span2"></asp:Label>

                        <asp:TextBox ID="txt_email_id" runat="server" CssClass="span3" Style="margin-right: -2px;
   "></asp:TextBox>

                    </div>
                </div>
                <div style="    margin-bottom: 10px;
    margin-left: 139px;">
                    <asp:Button ID="btn_sumbit1" runat="server" Text="Submit" CssClass="btn1" Style="float: none;" OnClick="btn_forgot_submit_Click" />
                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn1" Style="float: none;" />
                </div>
            </asp:Panel>
            <div class="right">
                <h2>Returning Customer</h2>
                <div enctype="multipart/form-data" method="post" action="">
                    <div class="content">
                        <p>I am a returning customer</p>
                        <b>E-Mail Address:</b><br>
                        <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" ErrorMessage="Please Enter Emailid"
                            ControlToValidate="txt_email" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        <br>
                        <br>
                        <b>Password:</b><br>
                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="Please Enter Password"
                            ControlToValidate="txt_password" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        <br>
                        <br>
                        <a href="#">
                            <asp:LinkButton ID="btnShow" runat="server" class="lost_password">Forgot password</asp:LinkButton></a><br>
                        <br>
                        <a style="margin-left: -55px;">
                            <asp:Button ID="btn_submit" runat="server" ValidationGroup="btnsubmit" class="button" OnClick="btn_submit_Click" Text="Login"></asp:Button></a>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="btnsubmit" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

