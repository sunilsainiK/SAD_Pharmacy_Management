<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryList.aspx.cs" Inherits="CategoryList" %>

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
        <asp:Repeater ID="rptCategories" runat="server">
            <HeaderTemplate>
                <table style="width: 100%" border="1px">
                    <tr style="background-color: Navy; color: White; font-weight: bold; text-align: center;">
                        <td style="width: 5%">
                            Sr#
                        </td>
                        <td style="width: 5%">
                            <asp:CheckBox ID="chbSelectAll" runat="server" />
                        </td>
                        <td style="width: 35%">
                            Name
                        </td>
                        <td style="width: 20%">
                            Date
                        </td>
                        <td style="width: 10%">
                            Time
                        </td>
                        <td style="width: 10%">
                            Status
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
                        <asp:Label ID="lblCategoryCode" Text='<%# Eval("CategoryCode") %>' Visible="false"
                            runat="server"></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:CheckBox ID="chbSelect" runat="server" />
                    </td>
                    <td>
                        <%# Eval("CategoryName") %>
                    </td>
                    <td style="text-align: center">
                        <%# Convert.ToDateTime(Eval("CreationDate")).ToString("dddd, MMMM dd, yyyy") %>
                    </td>
                    <td style="text-align: center">
                        <%# Convert.ToDateTime(Eval("CreationDate")).ToString("hh:mm tt") %>
                    </td>
                    <td style="text-align: center">
                        Status
                    </td>
                    <td style="text-align: center">
                        <asp:HyperLink ID="hlnkCategory" runat="server" Text="Update" NavigateUrl='<%# Eval("CategoryCode","CategoryUpdate.aspx?c_c_p={0}") %>'></asp:HyperLink>
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
                    <asp:Button ID="btnDelete" runat="server" Text="Remove" OnClick="btnDelete_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
