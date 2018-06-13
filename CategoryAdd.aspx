<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryAdd.aspx.cs" Inherits="CategoryAdd" %>
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
                    <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="center">
                    <asp:Button ID="btnSave" Text="Save" runat="server" onclick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
