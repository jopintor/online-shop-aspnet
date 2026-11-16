<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="PintorDelapenaKimSummative.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
        }
        .auto-style2 {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1 regform">
        <tr>
            <td>
                <span class="auto-style2">Admins</span></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" 
                    runat="server" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" CellSpacing="2">
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
            <td>
                <span class="auto-style2">Users</span>:</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView2" 
                    runat="server" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" CellSpacing="2">
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
                </asp:GridView></td>
        </tr>
    </table>
</asp:Content>
