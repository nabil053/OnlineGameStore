<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="Online_Game_Store.AdminHomePage" MasterPageFile="~/AdminPanel.Master" %>




<asp:Content ContentPlaceHolderID="LoggedInAdminEmailShow" ID="showAdminEmail" runat="server">

    <asp:Label ID="LabelShowEmail" runat="server"></asp:Label>

    
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="showStatusButtonsID" runat="server">
<table class="table">
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <%-- class=""--%>
                <td  >
                    
                    <table class="btn btn-outline-primary" align="center;">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotalPostCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="ImageTotalPostIcon" runat="server" Height="150px" ImageUrl="~/Images/bar_chart.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotlaPost" runat="server" Text="Total Post" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="LabelMorePost" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    
                </td>
                <td>
                    <table class="btn btn-outline-warning" align="center;">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotalCustomerCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl="~/Images/customer.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotalCustomer" runat="server" Text="Total Customer" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="Label3" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="btn btn-outline-danger">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotalMessageCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image2" runat="server" Height="150px" ImageUrl="~/Images/message.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelTotalMessage" runat="server" Text="Total Messages" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="Label6" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="btn btn-outline-success">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelOrdersCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image3" runat="server" Height="150px" ImageUrl="~/Images/orders.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelOrders" runat="server" Text="Total Orders" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="Label4" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                   <%-- <table class="btn btn-outline-secondary">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelCategoriesCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image4" runat="server" Height="150px" ImageUrl="~/Images/categories.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelCategories" runat="server" Text="Total Categories" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="Label8" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>--%>
                </td>
                <td>
                    <%--<table class="btn btn-outline-info">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelDevelopersCount" runat="server" Text="" Font-Names="Eras Demi ITC" Font-Size="65pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                            <td rowspan="2">
                                <asp:Image ID="Image5" runat="server" Height="150px" ImageUrl="~/Images/developers.png" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="LabelDevelopers" runat="server" Text="Total Developers" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Width="150px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="auto-style2">
                                <asp:Label ID="Label11" runat="server" Font-Names="Eras Demi ITC" Font-Size="25pt" Height="100px" Text="More Info &gt;&gt;" Width="300px"></asp:Label>
                            </td>
                        </tr>
                    </table>--%>
                </td>
            </tr>
        </table>
</asp:Content>