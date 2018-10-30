<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333;  font-size: 12px;" href="Default.aspx">Home</a><a  style="color: #333333;  font-size: 12px;"> » </a><a href="#">Account</a> <a  style="color: #333333;  font-size: 12px;">»</a> <a style="color: #333333;  font-size: 12px;" href="#">Change Password</a> </div>
        <!--Breadcrumb Part End-->
        <h1>Change Password</h1>
        <div enctype="multipart/form-data" method="post" action="">
            <h2>Change Password</h2>
            <div class="content">
                <table class="form">
                    <tbody>
                        <tr>
                            <td><span class="required">*</span> Old Password</td>
                            <td>
                                <asp:TextBox ID="txt_oldpassword" class="large-field" runat="server"></asp:TextBox></td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="None" ErrorMessage="Please Enter Old Password"
                    ControlToValidate="txt_oldpassword" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td><span class="required">*</span> New Password:</td>
                            <td>
                                <asp:TextBox ID="txt_newpassword" class="large-field" runat="server"></asp:TextBox></td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="Please Enter New Password"
                    ControlToValidate="txt_newpassword" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td><span class="required">*</span>Confrom Password:</td>
                            <td>
                                <asp:TextBox ID="txt_confrompasword" class="large-field" runat="server"></asp:TextBox></td>
                               <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None" Text="Password does not match"
                                ControlToCompare="txt_newpassword" ControlToValidate="txt_confrompasword" ValidationGroup="aa"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="None" ErrorMessage="Please Enter Confrom Password"
                    ControlToValidate="txt_confrompasword" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        </tr>
                    </tbody>
                </table>
            </div>
           
            <div class="buttons">
                <div class="left" style=" margin-left: 214px; ">
                    <asp:Button ID="btn_submit" class="button"  ValidationGroup="btnsubmit"   runat="server" OnClick="btn_submit_Click" Text="Submit"></asp:Button>
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="btnsubmit" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

