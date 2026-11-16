<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="PintorDelapenaKimSummative.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
            margin: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="regform" style="width:fit-content;">
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

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="btnCreate" 
                        runat="server" 
                        OnClick="btnCreate_Click" 
                        Text="Create Product" />
                </td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" 
                        OnClick="btnEdit_Click" 
                        Text="Edit Product" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
