<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Game_Store.Default" MasterPageFile="~/Home.Master"  %>

<asp:Content ContentPlaceHolderID="menuPlaceHolder" ID="menuIds" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                      <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        
                          <ul class="navbar-nav mr-auto">
                          <li class="nav-item dropdown">
                            <asp:Button class="btn btn-warning" runat="server" id="Platforms" Font-Size="15" Text="Platforms >" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                            <div  class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <asp:SqlDataSource ID="SqlDataSourcePlatforms" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [platform_id], [platform_title] FROM [platforms] WHERE ([platform_title] NOT LIKE '%' + @platform_title + '%')">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Select a Platform" Name="platform_title" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataListPlatforms" runat="server" DataKeyField="platform_id" DataSourceID="SqlDataSourcePlatforms">
                                    <ItemTemplate>
                                        <asp:Button class="btn btn-warning" ID="ButtonPlatforms" runat="server" Text='<%# Eval("platform_title") %>' OnClick="ButtonPlatforms_Click" CommandArgument='<%# Eval("platform_title") %>' Width="150px" />
                                    </ItemTemplate>
                                </asp:DataList>

                            </div>
                          </li>
                          <li class="nav-item active">
                              <asp:Button  Font-Size="15"  CssClass="btn btn-warning" ID="ButtonNews" runat="server" CausesValidation="false" Text="News" />
                            
                          </li>
                          <li class="nav-item dropdown">
                              <asp:Button Font-Size="15"  class="btn btn-warning" runat="server" id="Games" Text="Categories >" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" />
                           
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                               <div>
                                    <asp:DataList ID="DataListCategories" runat="server" BorderWidth="2px" DataSourceID="SqlDataSourceCat" CellPadding="2" HorizontalAlign="Left" Width="170px">
                                        <ItemTemplate>
                                            <%--<a class="dropdown-item" runat="server"   ></a>--%>                
                                         <asp:Button  class="btn btn-warning" ID="ButtonCatagories" runat="server"  CommandArgument='<%# Eval("category_title") %>' Text='<%# Eval("category_title") %>' OnClick="ButtonCatagories_Click" Width="220px" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSourceCat" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [category_title] FROM [categories] WHERE ([category_title] NOT LIKE '%' + @category_title + '%')">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Select A Category" Name="category_title" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                              
                            </div>
                          </li>
                          <li class="nav-item active">
                              <asp:Button Font-Size="15" CssClass="btn btn-warning" ID="ButtonMyAccount" OnClick="ButtonMyAccount_Click" runat="server" CausesValidation="false" Text="My Account" />
                            
                          </li>
                            
                            <li class="nav-item active">
                                <asp:Button Font-Size="15" CssClass="btn btn-warning" ID="ButtonFAQ" OnClick="ButtonFAQ_Click" runat="server" CausesValidation="false" Text="F.A.Q" />
                         
                          </li>
                            <li class="nav-item">
                                <asp:Button Font-Size="15" CssClass="btn btn-danger" OnClick="ButtonLoginText_Click" ID="ButtonLoginText" runat="server" CausesValidation="false" Text="Login" />
                          </li>
                        </ul>
          
   

                      </div>

                    </nav>
</asp:Content>
<asp:Content ContentPlaceHolderID="SearchPlaceHolder" ID="SearchID" runat="server">

                  <form class="form-inline" id="form2" >
                      <asp:TextBox class="form-control" placeholder="Search" ID="TextBoxSearch" runat="server"></asp:TextBox>
                      <asp:Button Font-Size="15"  class="btn btn-warning my-2 my-sm-0" ID="Button1" runat="server" Text="Search!" OnClick="Button1_Click"  />
                  </form>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT product_id, product_title, product_price, product_description, product_image, product_quantity FROM products WHERE (product_title LIKE '%' + @product_title + '%') OR (product_keyword LIKE '%' + @product_keyword + '%') OR (product_category IN (SELECT category_title FROM categories WHERE (category_title LIKE '%' + @category_title + '%'))) OR (product_developers IN (SELECT developer_title FROM developers WHERE (developer_title LIKE '%' + @developer_title + '%')))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="product_title" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="product_keyword" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="category_title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBoxSearch" Name="developer_title" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

</asp:Content>
<asp:Content ContentPlaceHolderID="SlidePlaceHolder1" ID="SlideID" runat="server">
        <div style="margin-left:13px;">
          
            <asp:SqlDataSource ID="SqlDataSourceSlides" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT TOP (5) product_ss1, product_id, product_title FROM products ORDER BY product_id"></asp:SqlDataSource>
             <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
 
                <asp:Repeater ID="Rgallary" runat="server" DataSourceID="SqlDataSourceSlides">
                <ItemTemplate>
                    <div class="item" >
                        <div class="item active ">
                             <div class="carousel-content ">
                            <div style="margin: 0 auto">
                            <asp:Image  class="rounded float-md-right" ID="imgId" runat="server" Width="1000px" Height="300px" ImageUrl='<%#Eval("product_ss1") %>' />
                           <asp:Button class="btn btn-dark" ID="ButtonViewSlidePost" runat="server"  OnClick="ButtonViewSlidePost_Click" Text='<%#Eval("product_title") %>' CommandArgument='<% #Eval("product_id") %>'  />
                              
                            </div>
                        </div>
                            </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
 
                </div>
 
            
            <a class="carousel-control-prev prev" href="#myCarousel" data-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span></a>
            <a class="carousel-control-next next" href="#myCarousel"   data-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span></a>
            </div>
            </div>
</asp:Content>

<asp:Content ID="DevelopersID" ContentPlaceHolderID="DevelopersPlaceHolder2" runat="server">
    <div id="list-example" class="list-group">
  <a class="btn btn-success" style="font-size:15px;" href="#list-item-1">Developers</a>
        <div>
            <div style="height: 315px; width: 245px; overflow-y:scroll;">
            <asp:DataList ID="DataListDevelopers" runat="server" BorderWidth="2px" DataSourceID="SqlDataSourceDev" CellPadding="2" HorizontalAlign="Left" Width="170px" OnItemCommand="DataListDevelopers_ItemCommand">
                <ItemTemplate>
                    <asp:Button class="btn btn-outline-success" ID="ButtonDevelopers" CommandArgument='<%# Eval("developer_title") %>' runat="server" Text='<%# Eval("developer_title") %>' Width="220px" CommandName="devButttonClick" />
                </ItemTemplate>
            </asp:DataList>
                </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceDev" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [developer_title] FROM [developers] WHERE ([developer_title] NOT LIKE '%' + @developer_title2 + '%')">
            <SelectParameters>
                <asp:Parameter DefaultValue="Select A Developer" Name="developer_title2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</asp:Content>




<asp:Content ID="contentID" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-light bg-light">


<div class="container">
        <div >
            <asp:SqlDataSource ID="SqlDataSourceAllProductByPlatforms" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_id], [product_title], [product_price], [product_description], [product_image], [product_platform],  [product_quantity] FROM [products] WHERE ([product_platform] = @product_platform)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="product_platform" QueryStringField="p_plat" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceShowAllProducts" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_id], [product_title], [product_price], [product_description], [product_image], [product_quantity] FROM [products]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceAllPRoductsByCat" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_id], [product_category], [product_title], [product_price], [product_description], [product_image],  [product_quantity] FROM [products] WHERE ([product_category] = @product_category)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="product_category" QueryStringField="p_cat" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceProductsByDev" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_id], [product_title], [product_price], [product_description], [product_image], [product_developers],  [product_quantity] FROM [products] WHERE ([product_developers] = @product_developers)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="product_developers" QueryStringField="p_dev" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="DataListProducts" runat="server" DataKeyField="product_id" DataSourceID="SqlDataSourceShowAllProducts" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" OnItemCommand="DataListProducts_ItemCommand">
                <ItemTemplate>
                    <div style="font-family:cursive">
                    <table class="card" align="center">
                        <tr>
                            <td class="auto-style2" colspan="3">
                                <asp:Image class="card-img-top" ID="ImageCover" runat="server" EnableTheming="False" Height="340px" ImageUrl='<%# Eval("product_image") %>' Width="340px" CssClass="card border-primary mb-3" style="left: 0px; top: 0px" BorderStyle="Ridge" BorderWidth="2px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5" colspan="3">
                                <asp:Label class="card-title"  ID="LabelTitle" runat="server" Font-Names="Bauhaus 93" Font-Size="Larger" Text='<%# Eval("product_title") %>' CssClass="card-title"></asp:Label>
                            </td>
                        </tr>
                            <div class="card-body text-secondary">
                        <tr>
                            <td class="card-header" colspan="3" style="text-align: center">
                                Price:
                                <asp:Label class="card-title" ID="LabelPrice" runat="server" Font-Names="Eras Demi ITC" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label class="card-text" ID="LabelDescription" runat="server" Font-Names="Eras Demi ITC" Font-Size="Large" Text='<%# Eval("product_description") %>' Width="360px" CssClass="card-body"></asp:Label>  
                             </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Button class="btn btn-primary" ID="ButtonViewPost" runat="server" Text="View&gt;&gt;" CommandName="ContentDemo" CommandArgument='<% #Eval("product_id") %>' Width="70px" />
                            </td>
                            <td class="auto-style4" style="width: 220px; text-align: center;">Avaliable:
                                <asp:Label ID="LabelQuantity" runat="server" class="card-title" Font-Names="Eras Demi ITC" Text='<%# Eval("product_quantity") %>' Visible="True"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:Button class="btn btn-success" ID="ButtonAddToCart" runat="server" Text="Add&gt;&gt;" OnClick="ButtonAddToCart_Click" CommandArgument='<%# Eval("product_title") + "," + Eval("product_quantity") + "," + Eval("product_price") %>' Width="70px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                        </div>
                </ItemTemplate>
                
            </asp:DataList>
       


</div>
      
</nav>
</asp:Content>



<asp:Content ContentPlaceHolderID="NewsFeedPlaceHolder" ID="NewsFeedId" runat="server">
    <div>
            <asp:DataList class="btn btn-success" ID="DataList1" runat="server" BorderWidth="2px" DataSourceID="SqlDataSourceNewsFeed" CellPadding="2" HorizontalAlign="center" Font-Size="15pt" >
                <ItemTemplate>
                    <marquee direction="left" width="1250px">
                        <asp:Label ID="LabelNews" runat="server" Font-Names="Eras Demi ITC"  Text='<%# Eval("news_feed") %>'></asp:Label>
                    </marquee>
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceNewsFeed" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [news_feed] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

<asp:Content ContentPlaceHolderID="CenterAdsPlaceHolder" ID="CenterAdsId" runat="server">
    <%--<img src="Images/asphalt.png" width="100%"   alt="...">--%>
     <div>
            <asp:DataList ID="DataList2" runat="server"  DataSourceID="SqlDataSourceAdsCenter"   HorizontalAlign="Left" RepeatDirection="Horizontal" >
                <ItemTemplate>
                    <asp:Image class="rounded float-left" ID="Image1" runat="server" Width="1250px"  ImageUrl='<%# Eval("ads_center_image") %>' />
                    <br />
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceAdsCenter" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [ads_center_image] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
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