<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ViewTransactions.aspx.cs" Inherits="PintorDelapenaKimSummative.User.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 33%;
        }
        .auto-style2 {
            width: 100%;
            text-align: left;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 100%;
            text-align: right
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Repeater ID="Repeater1" 
        runat="server" OnItemDataBound="Repeater1_ItemDataBound">
        <ItemTemplate>
            <table style="width: 60%; color: black;" class="regform auto-style4">
                <tr>
                    <td class="auto-style2">Transaction ID:&nbsp<asp:Label ID="lblTransactionID" runat="server" 
    Text=<%#DataBinder.Eval(Container,"DataItem.SaleCode")%>></asp:Label></td>
                    <td class="auto-style4">
                        Transaction Date:&nbsp<asp:Label
                        ID="lblTrxDate" runat="server" Text=<%#DataBinder.Eval(Container,"DataItem.PurchaseDate")%>></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style3">
                        <asp:GridView ID="GridView1" 
                            runat="server" BackColor="#DEBA84" 
                            BorderColor="#DEBA84" 
                            BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" CellSpacing="2" Width="100">
                            <FooterStyle BackColor="#F7DFB5" 
                                ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" 
                                Font-Bold="True" Font-Size="12pt" 
                                ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" 
                                HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" 
                                ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" 
                                Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%; text-align:right;"></td>
                    <td style="width:50%">Total: ₱
                        <asp:Label ID="lblTotal" runat="server" 
                            Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
