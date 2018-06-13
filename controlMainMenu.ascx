<%@ Control Language="C#" AutoEventWireup="true" CodeFile="controlMainMenu.ascx.cs"
    Inherits="Components_controlMainMenu" %>
<table border="0px" width="100%">
    <tr>
        <td>
            <asp:Menu ID="Menu1" runat="server" Orientation="Vertical">
                <Items>
                    <asp:MenuItem Text="Home" NavigateUrl="/Home.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Category" Value="Category">
                        <asp:MenuItem Text="New Category" Value="New Category" NavigateUrl="/Category/CategoryAdd.aspx">
                        </asp:MenuItem>
                        <asp:MenuItem Text="Category List" Value="Category List" NavigateUrl="/Category/CategoryList.aspx">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Products">
                        <asp:MenuItem Text="New Product" NavigateUrl="/Product/ProductAdd.aspx"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="/Product/ProductList.aspx" Text="Products List"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Sale Invoice" Value="Sale Invoice">
                        <asp:MenuItem Text="Add New" Value="Add New" NavigateUrl="/SaleInvoiceAdd.aspx">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Reports" Value="Reports">
                        <asp:MenuItem Text="Sale Report" Value="Sale Report" NavigateUrl="/Reports/SaleReport.aspx">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </td>
        <td align="right" valign="top">
            <asp:Button ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" />
        </td>
    </tr>
</table>
<br />
<br />
