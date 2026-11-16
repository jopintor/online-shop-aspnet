<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table tr td {
            padding-right: 25px;
            padding-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: fit-content;" class="regform">
        <table style="width:fit-content; color: black;">
            <tr>
                <td>Receipt for: </td>
                <td>
                    <asp:Label ID="lblTransactionID" 
                        runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: fit-content; color: black;" 
            border="1">
            <tr>
                <td>Item</td>
                <td>Price (+ 10% Tax)</td>
                <td>Quantity</td>
                <td>Amount</td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#DataBinder.Eval(Container,"DataItem.Product Name")%></td>
                        <td>₱<%#DataBinder.Eval(Container,"DataItem.Price")%></td>
                        <td class="auto-style2"><%#DataBinder.Eval(Container,"DataItem.Quantity")%></td>
                        <td class="auto-style3">₱<%#DataBinder.Eval(Container,"DataItem.Amount")%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lblTotal" runat="server" 
                        Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
