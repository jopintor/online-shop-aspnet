<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CreateProduct.aspx.cs" Inherits="PintorDelapenaKimSummative.Admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
            text-align: right;
        }
        .auto-style2 {
            width: fit-content;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
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
                <asp:Label ID="lblAdded" runat="server" 
                    Text="Product Added Successfully" 
                    Font-Size="10pt" ForeColor="#009933" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Product ID:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtProductID" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                    runat="server" 
                    ControlToValidate="txtProductID" 
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Product Name:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtProductName" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                    runat="server" 
                    ControlToValidate="txtProductName" 
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Stocks:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtStocks" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    runat="server" 
                    ControlToValidate="txtStocks" 
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Price:</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtSRP" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                    runat="server" 
                    ControlToValidate="txtSRP" 
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:Button ID="btnCreate" runat="server" 
                    Text="Create Product" 
                    OnClick="btnCreate_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
