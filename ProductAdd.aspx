<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductAdd.aspx.cs" Inherits="ProductAdd" %>
<%@ Register src="../Components/controlMainMenu.ascx" tagname="controlMainMenu" tagprefix="MyControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <mycontrols:controlmainmenu id="controlMainMenu1" runat="server" />
        <table>
            <tr>
                <td>
                    Category:
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Product Name:
                </td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Purchase Rate:
                </td>
                <td>
                    <asp:TextBox ID="txtPurchaseRate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Sale Rate:
                </td>
                <td>
                    <asp:TextBox ID="txtSaleRate" runat="server">
                    </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Expiry Date:
                </td>
                <td>
                    <asp:TextBox ID="txtExpiryDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Image:
                </td>
                <td>
                    <asp:FileUpload ID="upImage" runat="server" /><br />
                    only jpg,png or bmp files
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
