<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="../Components/controlMainMenu.ascx" TagName="controlMainMenu" TagPrefix="MyControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: Gray">
    <form id="form1" runat="server">
    <div>
        <MyControls:controlMainMenu ID="controlMainMenu1" runat="server" />
        Select Category:<asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="btnGetProductList" runat="server" Text="Get List" OnClick="btnGetProductList_Click" />
        <asp:Repeater ID="rptProducts" runat="server">
            <HeaderTemplate>
                <table style="width: 100%" border="1px">
                    <tr style="background-color: Navy; color: White; font-weight: bold; text-align: center;">
                        <td style="width: 5%">
                            Sr#
                        </td>
                        <td style="width: 5%">
                            <asp:CheckBox ID="chbSelectAll" runat="server" />
                        </td>
                        <td style="width: 25%">
                            Name
                        </td>
                        <td style="width: 20%">
                            P.Rate
                        </td>
                        <td style="width: 10%">
                            S.Rate
                        </td>
                        <td style="width: 10%">
                            Exp.Date
                        </td>
                        <td style="width: 10%">
                            Image
                        </td>
                        <td style="width: 15%">
                            Actions
                        </td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="text-align: center">
                        <%# Container.ItemIndex+1 %>
                        <asp:Label ID="lblProductCode" Visible="false" Text='<%# Eval("ProductCode") %>'
                            runat="server"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chbSelect" runat="server" />
                    </td>
                    <td>
                        <%# Eval("ProductName") %>
                    </td>
                    <td style="text-align: center">
                        <%# Eval("PurchaseRate") %>
                    </td>
                    <td style="text-align: center">
                        <%# Eval("SaleRate") %>
                    </td>
                    <td style="text-align: center">
                        <%#Convert.ToDateTime(Eval("ExpiryDate")).ToString("dd-MMM-yyyy") %>
                    </td>
                    <td style="text-align: center">
                        <asp:Image ID="imgProduct" runat="server" Height="25px" Width="45px" ImageUrl='<%# Eval("ImageURL","../Images/Uploads/{0}") %>' />
                    </td>
                    <td style="text-align: center">
                        <a href='<%# Eval("ProductCode","ProductUpdate.aspx?p_c_z={0}") %>'><img src="../Images/Icons/icon-dedit.gif" alt="Update" /> </a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Selected Products" OnClick="btnDelete_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
