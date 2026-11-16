<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table tr td {
            color: black;
            padding: 5px;
        }
        .auto-style1 {
            width: fit-content;
            text-align: right;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: fit-content;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:fit-content;" class="regform">
        <tr>
            <td colspan="3" class="auto-style2"><strong>
                Change Password</strong></td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" 
                    ControlToValidate="txtNew" 
                    Display="Dynamic" 
                    ErrorMessage="• Password must contain atleast 8 characters and a number" 
                    Font-Size="10pt" ForeColor="Red" 
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                <asp:Label ID="lblInvalidPassword" 
                    runat="server" Font-Size="10pt" 
                    ForeColor="Red" 
                    Text="• Invalid Password" 
                    Visible="False"></asp:Label>
                <asp:CompareValidator ID="CompareValidator1" 
                    runat="server" 
                    ControlToCompare="txtNew" 
                    ControlToValidate="txtConfirm" 
                    Display="Dynamic" 
                    ErrorMessage="• Password does not match" 
                    ForeColor="Red" Font-Size="10pt"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Current Password:</td>
            <td>
                <asp:TextBox ID="txtCurrent" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="txtCurrent" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">New Password:</td>
            <td>
                <asp:TextBox ID="txtNew" runat="server" 
                    TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
                    ControlToValidate="txtNew" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Confirm Password:</td>
            <td>
                <asp:TextBox ID="txtConfirm" 
                    runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    runat="server" 
                    ControlToValidate="txtConfirm" 
                    Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <asp:Button ID="btnConfirm" 
                    runat="server" 
                    OnClick="btnConfirm_Click" 
                    Text="Confirm" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
