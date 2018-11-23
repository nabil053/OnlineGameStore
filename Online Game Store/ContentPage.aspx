<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentPage.aspx.cs" Inherits="Online_Game_Store.ContentPage" MasterPageFile="~/Login.Master" %>

<asp:Content ContentPlaceHolderID="ContentLoginHolderId" ID="ContentPageID" runat="server">
    <div class="container-fluid">
        

        <div class="row">
            <div class="col-md-12">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="background-color:black;border: 5px solid black; margin: 20px;">
                    <div class="carousel-inner" style="height:290px;width:1000px;">
                        
                        <asp:SqlDataSource ID="CarouselSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_ss1], [product_ss2], [product_ss3] FROM [products] WHERE (product_id = @product_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="product_id" QueryStringField="p_id" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div class="carousel-item active">
                            <asp:DataList ID="Slide1DataList" runat="server" DataSourceID="CarouselSqlDataSource">
                            <ItemTemplate>
                                <asp:Image ID="Image1" height="290px" width="1000px" runat="server" ImageUrl='<%# Eval("product_ss1") %>' CssClass="d-block w-100"/>
                                <br />
                                <br />
                            </ItemTemplate>
                            </asp:DataList>
                        </div>

                        <div class="carousel-item">
                            <asp:DataList ID="Slide2DataList" runat="server" DataSourceID="CarouselSqlDataSource">
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" height="290px" width="1000px"  ImageUrl='<%# Eval("product_ss2") %>' CssClass="d-block w-100"/>
                                <br />
                                <br />
                            </ItemTemplate>
                            </asp:DataList>
                        </div>

                        <div class="carousel-item">
                            <asp:DataList ID="Slide3DataList" runat="server" DataSourceID="CarouselSqlDataSource">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" height="290px" width="1000px" ImageUrl='<%# Eval("product_ss3") %>' CssClass="d-block w-100"/>
                                <br />
                                <br />
                            </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="gameImage">
                    <asp:SqlDataSource ID="GamePictureSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT product_title, product_image, product_price FROM products WHERE (product_id = @product_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="" Name="product_id" QueryStringField="p_id" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:DataList ID="GamePictureDataList" runat="server" DataSourceID="GamePictureSqlDataSource">
                        <ItemTemplate>
                            <asp:Label ID="LabelProductTitle" runat="server" Text='<%# Eval("product_title") %>'></asp:Label>
                            <br />
                            <asp:Image ID="Image6" runat="server" ImageUrl='<%# Eval("product_image") %>' CssClass="img-fluid gameImageBig" Height="465px" Width="485px" />
                            <br />
                            Price :
                            <asp:Label ID="LabelContentPrices" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                            Tk Only.<br />
                        </ItemTemplate>
                    </asp:DataList>

                </div>

                <asp:SqlDataSource ID="DataForButtonSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_price], [product_quantity], [product_title] FROM [products] WHERE ([product_id] = @product_id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="product_id" QueryStringField="p_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:DataList ID="DataForButtonDataList" runat="server" DataSourceID="DataForButtonSqlDataSource" OnItemCommand="DataForButtonDataList_ItemCommand" >
                    <ItemTemplate>
                        <asp:Button ID="AddToCartButton" runat="server" BackColor="Orange" Text="Add To Cart" CssClass="btn-lg buttonMargin" CommandName="AddToCart" CommandArgument='<%# Eval("product_title") + "," + Eval("product_quantity") + "," + Eval("product_price") %>' />
                        <div visible="false" id="alertBox" runat="server" class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Out of Stock!</strong><asp:Label ID="messageLabel" runat="server"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>

            <div class="col-md-7">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="synopsis_section" class="customDiv">
                            <p style="font-size:x-large;">Synopsis:</p>
                            
                            <asp:SqlDataSource ID="SynopsisSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_description] FROM [products] WHERE ([product_id] = @product_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="product_id" QueryStringField="p_id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:DataList ID="SynopsisDataList" runat="server" DataSourceID="SynopsisSqlDataSource">
                                <ItemTemplate>
                                    <asp:Label ID="SynopsisLabel" runat="server" Text='<%# Eval("product_description") %>' />
                                    <br />
<br />
                                </ItemTemplate>
                            </asp:DataList>
                            
                            <br />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div id="minimum_requirements_section" class="customDiv">
                            <p style="font-size:x-large;">Minimum Requirements:</p>
                            <asp:DataList ID="RequirementsDataList" runat="server" DataSourceID="RequirementsSqlDataSource">
                                <ItemTemplate>
                                    * Graphics Card:
                                    <asp:Label ID="Graphics_CardLabel" runat="server" Text='<%# Eval("product_graphics_card") %>' />
                                    <br />
                                    * CPU:
                                    <asp:Label ID="CPULabel" runat="server" Text='<%# Eval("product_cpu") %>' />
                                    <br />
                                    * RAM:
                                    <asp:Label ID="RAMLabel" runat="server" Text='<%# Eval("product_ram") %>' />
                                    <br />
                                    * OS:
                                    <asp:Label ID="OSLabel" runat="server" Text='<%# Eval("product_os") %>' />
                                    <br />
<br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="RequirementsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [product_graphics_card] , [product_cpu], [product_ram], [product_os] FROM [products] WHERE ([product_id] = @product_id)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="product_id" QueryStringField="p_id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <p style="background-color:orange; padding:20px; font-size:x-large; margin-left: 20px; margin-right: 20px;"><b>You may also like:</b></p>
            </div>
        </div>

        <div class="row">
            
            <asp:SqlDataSource ID="SuggestionsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT TOP 4 [product_image], [product_id] FROM [products] WHERE ([product_id] &lt;&gt; @product_id)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="product_id" QueryStringField="p_id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DataList ID="SuggestionsDataList" runat="server" DataSourceID="SuggestionsSqlDataSource" RepeatDirection="Horizontal" OnItemCommand="SuggestionsDataList_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6">
                        <div class="customSuggestionDiv" style="padding:0px; width:267px;">
                            
                            <asp:Image ID="Image7" runat="server" Height="295px" ImageUrl='<%# Eval("product_image") %>' Width="260px" CssClass="img-fluid" />
                            
                        </div>

                        <div style="margin-bottom:20px;">
                        <asp:Button ID="AddButton" runat="server" BackColor="Orange" Text="View" CssClass="btn-lg" CommandName="ViewProduct" CommandArgument='<%# Eval("product_id") %>' />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            
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
    <asp:Button Font-Size="12" class="btn btn-warning" ID="GoToCart"  runat="server" Text="Go To Cart" OnClick="GoToCart_Click"  />
</asp:Content>