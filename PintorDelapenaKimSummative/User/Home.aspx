<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            vertical-align: middle;
            text-align: center;
            width:auto;
        }
        .auto-style2 {
            width: fit-content;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="regform">
        <div class="products">
            Product List:<br />
&nbsp;<asp:Repeater ID="Repeater1" 
                runat="server" 
                OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <div class="productitem">
                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lblProductID" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.ProductID")%> Font-Size="10"></asp:Label> <asp:Label
                                       ID="Label1" runat="server" Font-Size="10">Stocks: <%#DataBinder.Eval(Container,"DataItem.Stocks")%></asp:Label>  </td>
                                <td rowspan="3" class="auto-style1"><asp:Button ID="Button1" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.InCart")%> UseSubmitBehavior="False" CommandName="Add" /></td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lblProduct" runat="server" Text=""><%#DataBinder.Eval(Container,"DataItem.ProductName")%></asp:Label>  </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lblPrice" runat="server">₱<%#DataBinder.Eval(Container,"DataItem.SRP")%></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    
</asp:Content>
