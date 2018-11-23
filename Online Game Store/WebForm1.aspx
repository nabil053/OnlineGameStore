<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Online_Game_Store.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Names="Eras Demi ITC" Font-Size="X-Large" Text="Manage Content" Width="230px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewSite" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View Site" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonInsertProduct" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Insert New Product" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewAllProduct" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View All Product" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonInsertCategory" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Insert New Category" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewCategory" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View All Category" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonInsertDeveloper" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Insert New Developer" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewDeveloper" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View All Developer" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewCustomers" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View Customers" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewOrders" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View Orders" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonUpdateSlides" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Update Slides" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonUpdateOtherImages" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Update Other Images" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonUpdateNewsFeed" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Update News Feed" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonViewMessages" class="btn btn-outline-primary" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text="View Customer Message" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="ButtonLogout" runat="server" class="btn btn-outline-danger" Font-Names="Eras Demi ITC" Font-Size="Large" Text="Logout" Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
