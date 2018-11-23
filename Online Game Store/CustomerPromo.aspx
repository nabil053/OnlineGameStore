<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerPromo.aspx.cs" Inherits="Online_Game_Store.CustomerPromo" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="CustomerPromoID" runat="server">
    
    <table style="margin:0px;font-family:Arial;width:1200px;border: 2px solid black;" align="left">
        
        <tr >
           
            
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="myAccount" runat="server" Text="My Account" Width="150px" CausesValidation="false" OnClick="myAccount_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="Edit Account" Width="150px" CausesValidation="false" OnClick="Button1_Click" />
            </td>
             <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button3" runat="server" Text="My Orders" Width="150px" CausesValidation="false" OnClick="Button3_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-danger" ID="Button1CustomerLogout" runat="server" Text="Logout" Width="150px" CausesValidation="false" OnClick="Button1CustomerLogout_Click" />
            </td>

        </tr>
        <tr >
          <td class="container" style="margin:0px;border: 2px solid black; width: 861px;background-image:url('Images/profile_image.jpg'); text-align: center;" colspan="4" align="center">
                <div  class="container" style="text-align: center">
                
                    <asp:SqlDataSource ID="SqlDataSourceViewProfileOrders" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [Id], [card_number], [cardholder_name], [quantities], [total_price], [date], [status], [products] FROM [master_card_table] WHERE ([customer_email] = @customer_email)" DeleteCommand="DELETE FROM [master_card_table] WHERE ([customer_email] = @customer_email)">
                        <SelectParameters>
                            <asp:SessionParameter Name="customer_email" SessionField="c_email" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="text-align: center">
                        <br />
                        <div class="auto-style2">
                            <table class="nav-justified">
                                <tr>
                                    <td style="width: 442px; text-align: left;">
                                        <asp:Label ID="LabelPromo" runat="server" Text="Promo Code" CssClass="badge-success" Font-Names="Eras Demi ITC" Font-Size="30pt"></asp:Label>
                                    </td>
                                    <td style="text-align: left">
                                        <asp:Label ID="LabelPromoList" runat="server" Text="List Of Codes" CssClass="badge-primary" Font-Names="Eras Demi ITC" Font-Size="30pt"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 442px">
                                        <table class="nav-justified">
                                            <tr>
                                                <td class="auto-style2" style="text-align: right">
                                                    <asp:TextBox ID="TextBoxPromoCode" runat="server" CssClass="form-control" Text="" Font-Names="Eras Demi ITC" Font-Size="20pt" Width="300px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Label ID="LabelPromoWarning" runat="server" CssClass="badge-warning" Font-Names="Eras Demi ITC" Font-Size="20pt"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:Button ID="ButtonPromoApply" runat="server" Text="Apply" CssClass="btn btn-primary" Font-Names="Eras Demi ITC" Font-Size="20pt" OnClick="ButtonPromoApply_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="SqlDataSourcePromo" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [code], [discount], [status], [c_email], [end_date] FROM [promo_code] WHERE ([c_email] = @c_email)" DeleteCommand="Delete from [promo_code] where WHERE ([c_email] = @c_email)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="c_email" SessionField="c_email" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                        <div class="auto-style2">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourcePromo" ForeColor="#333333" style="font-size: large">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                                                    <asp:BoundField DataField="discount" HeaderText="discount" SortExpression="discount" />
                                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
                                                    <asp:BoundField DataField="c_email" HeaderText="c_email" SortExpression="c_email" />
                                                    <asp:BoundField DataField="end_date" HeaderText="end_date" SortExpression="end_date" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Top" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 442px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                <br />
<br />

                    </div>
                
                </div>
            </td>
        </tr>
        
       
    </table>
    
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
                    <asp:Image  class="rounded float-right" ID="Image2" runat="server" ImageUrl='<%# Eval("ads_cover_image") %>' height="150px" Width="800px" />
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
    <asp:Button CausesValidation="false" Font-Size="12" class="btn btn-warning" ID="GoToCart"  runat="server" Text="Go To Cart" OnClick="GoToCart_Click"  />
</asp:Content>