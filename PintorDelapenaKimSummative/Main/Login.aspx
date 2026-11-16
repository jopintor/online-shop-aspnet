<%@ Page Title="" Language="C#" MasterPageFile="~/Main/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PintorDelapenaKimSummative.Main.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
            text-align: right;
        }
        .auto-style2 {
            width: 130px;
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: left;
            height: 22px;
        }
        .auto-style5 {
            width: fit-content;
            text-align: right;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:fit-content;" class="regform">
        <tr>
            <td class="auto-style4" colspan="3">
                <asp:Label ID="lblAccountNotFound" 
                    runat="server" Font-Size="10pt" 
                    ForeColor="Red" 
                    Text="• Email Not Found" 
                    Visible="False"></asp:Label>
                <asp:Label ID="lblPassword" 
                    runat="server" Font-Size="10pt" 
                    ForeColor="Red" 
                    Text="• Incorrect Password" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Email Address:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmailAddress" 
                    runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" ErrorMessage="*" 
                    ForeColor="Red" 
                    ControlToValidate="txtEmailAddress"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Password:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPassword" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" ErrorMessage="*" 
                    ForeColor="Red" 
                    ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Button ID="btnLogin" runat="server" 
                    Text="Login" 
                    OnClick="btnLogin_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <a href="Register.aspx">Go to Register</a></td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
