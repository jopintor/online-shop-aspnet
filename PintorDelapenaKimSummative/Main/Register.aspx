<%@ Page Title="" Language="C#" MasterPageFile="~/Main/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PintorDelapenaKimSummative.Main.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 22px;
    }
    .auto-style2 {
        width: fit-content;
        text-align: right;
    }
    .auto-style4 {
        width: 150px;
        text-align: center;
    }
    .auto-style5 {
        text-align: center;
    }
    .auto-style6 {
        height: fit-content;
        text-align: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:fit-content;" class="regform">
        <tr>
            <td class="auto-style6" colspan="3">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" 
                    ControlToValidate="txtPassword" 
                    Display="Dynamic" 
                    ErrorMessage="• Password must contain atleast 8 characters and a number" 
                    ForeColor="Red" 
                    
                    
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" 
                    Font-Size="10pt"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" 
                    runat="server" 
                    ControlToCompare="txtPassword" 
                    ControlToValidate="txtConfirmPassword" 
                    Display="Dynamic" 
                    ErrorMessage="• Password does not match" 
                    ForeColor="Red" Font-Size="10pt"></asp:CompareValidator>
                <asp:Label ID="lblRegistered" runat="server" 
                    Font-Size="10pt" ForeColor="Red" 
                    Text="• Email already registered" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email Address:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmailAddress" 
                    runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="txtEmailAddress" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">First Name:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtFirstName" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
                    ControlToValidate="txtFirstName" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtLastName" 
                    runat="server"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    runat="server" 
                    ControlToValidate="txtLastName" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Password:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPassword" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                    runat="server" 
                    ControlToValidate="txtPassword" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Confirm Password:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtConfirmPassword" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                    runat="server" 
                    ControlToValidate="txtConfirmPassword" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                &nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                <asp:Button ID="btnRegister" runat="server" 
                    Text="Register" 
                    OnClick="btnRegister_Click"/>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                <a href="Login.aspx">Go to Login</a></td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
