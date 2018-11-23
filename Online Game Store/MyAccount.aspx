<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="Online_Game_Store.MyAccount" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="LoginID" runat="server">
    <table style="margin:0px;font-family:Arial;width:1200px;border: 2px solid black;" align="left">
        
        <tr >
           
            
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="viewOrders" runat="server" Text="My Orders" Width="150px"  CausesValidation="false" OnClick="viewOrders_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="Edit Account" Width="150px" OnClick="Button1_Click" CausesValidation="false" />
            </td>
             <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button3" runat="server" Text="Promo Code" Width="150px" CausesValidation="false" OnClick="Button3_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-danger" ID="Button1CustomerLogout" runat="server" Text="Logout" Width="150px" CausesValidation="false" OnClick="Button1CustomerLogout_Click" />
            </td>

        </tr>
        <tr >
          <td class="container" style="margin:0px;border: 2px solid black; width: 861px;background-image:url('Images/profile_image.jpg'); text-align: center;" colspan="4" align="center">
                <asp:SqlDataSource ID="SqlDataSourceCustomerInfo" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [customer_name], [customer_email], [customer_pass], [customer_country], [customer_city], [customer_contact], [customer_address], [customer_gender] FROM [customer] WHERE ([customer_email] = @customer_email)">
                    <SelectParameters>
                        <asp:SessionParameter Name="customer_email" SessionField="c_email" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div style="text-align: center">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceCustomerInfo">
                    <ItemTemplate>
                        <div style="text-align:center;">
                        <div style="width:50%; margin: 0 auto; text-align:left;">
                        <table style="width: 800px;height:auto;font-family:Arial;" align="center">
                            <tr>
                                
                                <td colspan="2">
                                    <asp:Label class="btn btn-danger" ID="LabelProfieIn" runat="server" Text='Profile Information' Width="800px"></asp:Label>
                                </td>
                               
                            </tr>
                            <tr>
                                <td  style=" width: 75px; text-align: right;">
                                    <asp:Button class="btn btn-dark" ID="Button4" runat="server" Text="Name:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelName" runat="server" Text='<%# Eval("customer_name") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 75px; text-align: right; ">
                                    <asp:Button class="btn btn-dark" ID="Button5" runat="server" Text="Email:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelEmail" runat="server" Text='<%# Eval("customer_email") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 75px; text-align: right;">
                                    <asp:Button class="btn btn-dark" ID="Button6" runat="server" Text="Country:" Width="300px" />
                                </td>
                                <td ">
                                    <asp:Label class="btn btn-dark" ID="LabelCountry" runat="server" Text='<%# Eval("customer_country") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 75px; text-align: right;">
                                    <asp:Button class="btn btn-dark" ID="Button7" runat="server" Text="City:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelCity" runat="server" Text='<%# Eval("customer_city") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style=" width: 75px; text-align: right;">
                                    <asp:Button class="btn btn-dark" ID="Button8" runat="server" Text="Contact:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelContact" runat="server" Text='<%# Eval("customer_contact") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 75px; text-align: right;" >
                                    <asp:Button class="btn btn-dark" ID="Button9" runat="server" Text="Address:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelAddress" runat="server" Text='<%# Eval("customer_address") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 75px; text-align: right;" >
                                    <asp:Button class="btn btn-dark" ID="Button10" runat="server" Text="Gender:" Width="300px" />
                                </td>
                                <td >
                                    <asp:Label class="btn btn-dark" ID="LabelGender" runat="server" Text='<%# Eval("customer_gender") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            
                        </table>
                            </div>
                            </div>
                        <br />
<br />
                    </ItemTemplate>
                </asp:DataList>
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
    <asp:Button Font-Size="12" class="btn btn-warning" ID="GoToCart"  runat="server" Text="Go To Cart" OnClick="GoToCart_Click"  />
</asp:Content>