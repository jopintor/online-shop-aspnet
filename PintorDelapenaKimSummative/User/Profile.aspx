<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table tr td {
            padding: 5px;
            color: black;
        }
        .auto-style1 {
            width: fit-content;
            text-align: right;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            text-align: center;

        }

        .auto-style4 {
            width: fit-content;
            text-align: right;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:fit-content; padding:5px;" class="regform">
        <tr>
            <td class="auto-style3" colspan="2"><strong>User 
                Profile</strong></td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>Email Address:</strong></td>
            <td>
                <asp:Label ID="lblEmail" runat="server" 
                    Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>First Name:</strong></td>
            <td>
                <asp:Label ID="lblFirstName" runat="server" 
                    Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>Last Name:</strong></td>
            <td>
                <asp:Label ID="lblLastName" runat="server" 
                    Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>Membership Type:</strong></td>
            <td>
                <asp:Label ID="lblMembership" runat="server" 
                    Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:Button ID="btnChange" 
                    runat="server" 
                    Text="Change Password" 
                    OnClick="btnChange_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
