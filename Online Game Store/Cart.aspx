<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Online_Game_Store.Cart" MasterPageFile="~/Login.Master" %>

<asp:Content ContentPlaceHolderID="ContentLoginHolderId" ID="CartPageID" runat="server">
            <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">

                <table class="auto-style1" style="margin-top:10px;">
                    <tr>
                        <th style="border:3px solid black;width:350px;">Product Name</th>
                        <th style="border:3px solid black;width:120px;">Price</th>
                        <th style="border:3px solid black;width:100px;">Quantity</th>
                        <th style="border:3px solid black;width:120px;">Total Price</th>
                        <th style="border:3px solid black;width:120px;">VAT</th>
                        <th style="border:3px solid black;width:120px;">Net Total</th>
                        <th style="border:3px solid black;width:120px;">Update</th>
                        <th style="border:3px solid black;width:120px;">Delete</th>
                    </tr>
                </table>

                <asp:DataList ID="CartDataList" runat="server" DataSourceID="CartSqlDataSource" BorderColor="Lime" OnItemCommand="CartDataList_ItemCommand" >
                    <ItemTemplate>
                        <table class="auto-style1" style="margin-top:0px;margin-bottom:0px;width:1170px;">
                            <tr style="margin-top:0px;margin-bottom:0px;">
                                <td style="border:3px solid black;width:345px;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("product_title") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:100px;">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("product_quantity") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("total_price") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("vat") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("net_total") %>'></asp:Label>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:TextBox ID="TextBoxQuantity" placeholder="update quantity" runat="server" TextMode="Number" Text="" Width="110px"></asp:TextBox>
                                    <asp:Button ID="UpdateButton" runat="server" Text="Confirm" BackColor="Green" CssClass="btn-sm" CommandName="UpdateQuantity" CommandArgument='<%# Eval("Id") + "," +  Eval("user_id") + "," + Eval("product_price") + "," + Eval("product_title") %>' Width="80px"/>
                                    <div visible="false" id="alertBox" runat="server" class="alert alert-danger alert-dismissible">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Error! </strong><asp:Label ID="messageLabel" runat="server" Width="110px"></asp:Label>
                                    </div>
                                </td>
                                <td style="border:3px solid black;width:120px;">
                                    <asp:Button ID="DeleteButton" runat="server" Text="Confirm" BackColor="Red" CssClass="btn-sm" CommandName="DeleteProduct" CommandArgument='<%# Eval("Id") + "," +  Eval("user_id") %>'/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <table class="auto-style1">
                    <tr>
                        <td style="border:3px solid black;width:900px">&nbsp;</td>
                        <th style="border:3px solid black;width:150px">Total:</th>
                        <th style="border:3px solid black;width:150px;">
                            <asp:DataList ID="TotalDataList" runat="server" DataSourceID="TotalSqlDataSource">
                                <ItemTemplate>
                                    <asp:Label ID="net_total_sumLabel" runat="server" Text='<%# Eval("net_total_sum") %>' />
                                </ItemTemplate>
                            </asp:DataList>
                        </th>
                    </tr>
                    <tr>
                        <td style="border:3px solid black;width:900px">&nbsp;</td>
                        <th style="border:3px solid black;width:150px">Discount:</th>
                        <th style="border:3px solid black;width:150px;">
                           
                            <asp:Label ID="total_with_discount" runat="server" Text='<%# Eval("net_total_sum") %>' />
                             
                        </th>
                    </tr>
                </table>
                <asp:SqlDataSource ID="CartSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT Id, user_id, product_title, product_price, product_quantity, total_price, vat, net_total FROM cart WHERE (user_id = @user_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="user_id" QueryStringField="u_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="TotalSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT SUM(net_total) AS net_total_sum FROM cart WHERE (user_id = @user_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="user_id" QueryStringField="u_id" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Button ID="ProceedButton" BackColor="Orange" Text="Proceed" CssClass="btn-lg proceedButtonMargin" CommandName="ProceedWithPurchase" runat="server" OnClick="ProceedButton_Click" />
                <div visible="false" id="alertBox" runat="server" class="alert alert-danger alert-dismissible">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeaderPlaceHolder" ID="HeaderPlaceID" runat="server">

    <div>
            <asp:DataList ID="DataListHeaderImage" runat="server" DataSourceID="SqlDataSourceHeaderImage" CellPadding="0" HorizontalAlign="Left" RepeatDirection="Horizontal" >
                <ItemTemplate>
                   <a href="Default.aspx"> <asp:Image class="rounded float-left" ID="Image1" runat="server" Height="180px" ImageUrl='<%# Eval("header_image") %>' Width="180px" /><a/>
                    <br />
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceHeaderImage" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [header_image] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>                 
</asp:Content>
<asp:Content ContentPlaceHolderID="BannerPlaceHolder" ID="BannerPlaceId" runat="server">
     
        <div>
            <asp:DataList ID="DataListBannerImage" runat="server" DataSourceID="SqlDataSourceBannerImage" CellPadding="0" HorizontalAlign="right" RepeatDirection="Horizontal" >
                <ItemTemplate>
                    <asp:Image  class="rounded float-right" ID="Image1" runat="server" ImageUrl='<%# Eval("ads_cover_image") %>' height="150px" Width="800px" />
                    <br />
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceBannerImage" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [ads_cover_image] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

<asp:Content ContentPlaceHolderID="goToCartPlaceHolder" ID="cartID" runat="server">
    <asp:Button class="btn btn-warning" ID="ButtonBackToBuy"  runat="server" Text="Back 2 Buy" OnClick="ButtonBackToBuy_Click1"  />
</asp:Content>