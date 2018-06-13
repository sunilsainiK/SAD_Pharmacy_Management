<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryUpdate.aspx.cs" Inherits="CategoryUpdate" %>

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
        <table>
            <tr>
                <td>
                    Category Name:
                </td>
                <td>
                    <asp:TextBox ID="txtCategoryName" AutoComplete="off" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <asp:Button ID="btnUpdate" Text="Update" runat="server" OnClick="btnUpdate_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
