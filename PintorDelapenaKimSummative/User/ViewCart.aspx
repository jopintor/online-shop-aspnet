<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
            padding: 5px;
        }
        .auto-style2 {
            width: fit-content;
            text-align: center;
            padding: 5px;
        }
        .auto-style3 {
            width: fit-content;
            text-align: center;
            padding: 5px;
        }
        .auto-style4 {
            padding: 5px;
        }
        .auto-style5 {
            width: fit-content;
            padding: 5px;
        }
        .auto-style6 {
            width: fit-content;
            text-align: center;
            font-weight: bold;
            padding: 5px;
        }
        .auto-style7 {
            color: #660033;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:fit-content; color: black;" 
        class="regform" border="1">
        <tr>
            <td class="auto-style5">Product ID</td>
            <td class="auto-style5">Product Name</td>
            <td class="auto-style6">Amount</td>
            <td class="auto-style3">Price</td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lblProductID" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.ProductID")%>></asp:Label></td>
                    <td class="auto-style2">
                        <asp:Label ID="lblProductName" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.ProductName")%>></asp:Label></td>
                    <td class="auto-style2">
                        <asp:Label ID="lblAmount" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.Amount")%>></asp:Label></td>
                    <td class="auto-style2">₱ <%#DataBinder.Eval(Container,"DataItem.Price")%></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="+" UseSubmitBehavior="False" CommandName="Increase"/>&nbsp<asp:Button
                            ID="Button2" runat="server" Text="-" UseSubmitBehavior="False" CommandName="Decrease"/></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4" colspan="2">Total 
                (+10% Tax): <asp:Label ID="lblTotal" runat="server" 
                Text=""></asp:Label></td>
            <td class="auto-style3">
                <asp:Button ID="btnCheckout" runat="server" 
                    Text="Check Out" 
                    OnClick="btnCheckout_Click"/>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
