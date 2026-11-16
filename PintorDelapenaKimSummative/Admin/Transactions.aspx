<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="PintorDelapenaKimSummative.Admin.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: fit-content;
            color: black;
        }
        .auto-style2 {
            width: fit-content;
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: fit-content;
            text-align: right;
            color: #000000;
        }
        .auto-style5 {
            color: #000000;
        }
        .auto-style6 {
            width: fit-content;
            text-align: right;
            color: #000000;
        }
        .auto-style7 {
            height: 265px;
        }
        .auto-style8 {
            color: #660033;
        }
        .auto-style9 {
            width: fit-content;
            text-align: right;
            height: 23px;
        }
        .auto-style10 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1 regform">
        <tr>
            <td class="auto-style3" colspan="2">
                <asp:Label ID="lblNotFound" 
                    runat="server" Font-Size="10pt" 
                    ForeColor="Red" Text="Email Not Found" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Find by Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" 
                    runat="server" TextMode="Email" Height="16px"></asp:TextBox>
                <br />
                <br />
                &nbsp
                <asp:Button ID="btnSearch" runat="server" 
                    Text="Search" 
                    OnClick="btnSearch_Click" Height="35px" Width="90px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><span class="auto-style5">User:</span>:</td>
            <td>
                <asp:DropDownList ID="drpUser" 
                    runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="drpUser_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">User ID:</td>
            <td>
                <asp:DropDownList ID="drpUserID" 
                    runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="drpUserID_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style9"><span class="auto-style5">Transaction:</span> </td>
            <td class="auto-style10">
                <asp:DropDownList ID="drpTransaction" 
                    runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="drpTransaction_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style7">
                <asp:GridView ID="GridView1" 
                    runat="server" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" CellSpacing="2" Height="139px" Width="205px">
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
            <td colspan="2">
                <asp:Label ID="lblTotal" runat="server" 
                    Text="" CssClass="auto-style8"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
