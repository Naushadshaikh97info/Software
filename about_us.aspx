<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about_us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333;  font-size: 12px;" href="Default.aspx">Home</a><a  style="color: #333333;  font-size: 12px;"> » </a><a style="color: #333333;  font-size: 12px;" href="#">About Us</a></div>
        <!--Breadcrumb Part End-->
        <h1>About Us</h1>
        <p>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </p>
    </div>
</asp:Content>

