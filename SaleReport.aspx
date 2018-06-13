<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SaleReport.aspx.cs" Inherits="SaleReport" %>

<%@ Register Src="../Components/controlMainMenu.ascx" TagName="controlMainMenu" TagPrefix="MyControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <MyControls:controlMainMenu ID="controlMainMenu1" runat="server" />
        <asp:Repeater ID="rptSaleReport" runat="server" 
            onitemdatabound="rptSaleReport_ItemDataBound">
            <HeaderTemplate>
                <table style="width: 100%" border="1px">
                    <tr style="background-color: Navy; color: White; font-weight: bold; text-align: center;">
                        <td style="width: 5%">
                            Inv.#
                        </td>
                        <td style="width: 35%">
                            Customer Name
                        </td>
                        <td style="width: 20%">
                            Date
                        </td>
                        <td style="width: 10%">
                            Total Amount
                        </td>
                        <td style="width: 15%">
                            Actions
                        </td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: center">
                        <%# Eval("SaleInvoiceCode") %>
                    </td>
                    <td>
                        <%# Eval("CustomerName") %>
                    </td>
                    <td style="text-align: center">
                        <%# Convert.ToDateTime(Eval("InvoiceDate")).ToString("dddd, MMMM dd, yyyy") %>
                    </td>
                    <td style="text-align: center">
                        <%# Eval("GrandTotal") %>
                    </td>
                    <td style="text-align: center">
                        <%--<asp:HyperLink ID="hlnkCategory" runat="server" Text="Update" NavigateUrl='<%# Eval("CategoryCode","CategoryUpdate.aspx?c_c_p={0}") %>'></asp:HyperLink>--%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                <tr style="background-color: Navy; color: White; font-weight: bold; text-align: center;">
                    <td style="width: 5%">
                    </td>
                    <td style="width: 35%">
                    </td>
                    <td style="width: 20%">
                    </td>
                    <td style="width: 10%">
                        <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                    </td>
                    <td style="width: 15%">
                       
                    </td>
                </tr>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
