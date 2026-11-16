<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="PintorDelapenaKimSummative.Admin.WebForm5" %>
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
                <asp:Label ID="lblEdit" runat="server" 
                    Text="Product Edit Successful" 
                    ForeColor="#009933" 
                    Visible="False"></asp:Label>
                <asp:Label ID="lblDelete" runat="server" 
                    Text="Product Delete Successful" 
                    ForeColor="#009933" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Select Product:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="drpProducts" 
                    runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="drpProducts_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Product Number:</td>
            <td class="auto-style2">
                <asp:Label ID="lblProductNumber" 
                    runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
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
                <asp:TextBox ID="txtPrice" 
                    runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                    runat="server" 
                    ControlToValidate="txtPrice" 
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <asp:Button ID="btnDelete" 
                    runat="server" 
                    OnClick="btnDelete_Click" 
                    Text="Delete" />
&nbsp;&nbsp;
                <asp:Button ID="btnUpdate" runat="server" 
                    Text="Update" 
                    OnClick="btnUpdate_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>

