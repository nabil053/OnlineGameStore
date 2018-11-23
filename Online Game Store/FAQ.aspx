<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Online_Game_Store.FAQ" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="FAQID" runat="server">
<div class="Whole">
    <div class="container">

        <h1 style="font-family: 'Gaegu', cursive;">FAQ</h1>

<!-- Bootstrap FAQ - START -->
        
                
            <div class="alert alert-warning alert-dismissible" role="alert" style="font-family: 'Glyphicons Halflings';">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                This section contains a wealth of information, related to <strong>PrepBootstrap</strong> and its store. If you cannot find an answer to your question, 
                make sure to contact us. 
            </div>

            <br />

                
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceFaq">
                <ItemTemplate>
                    <div class="panel panel-default panel-transparent">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            Question:</h4>
                        <h4 class="panel-title">
                            <asp:Label ID="LabelQuestion" runat="server" Font-Size="Medium" Height="50px" Text='<%# Eval("Question_1") %>' Width="900px"></asp:Label>
                        </h4>
                    </div>
                            <strong><span class="auto-style6">Answer:</span></strong><br />
                        
                        <asp:Label Style="overflow:scroll" ID="Label4" runat="server" Text='<%# Eval("Answer_1") %>' Width="900px"></asp:Label>
                        </div>
                </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSourceFaq" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [Question_1], [Answer_1] FROM [Faq]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
</div>
            
            
        </div>
            
        

        <style>
            .faqHeader {
                font-size: 30px;
                margin-top:60px;
                font-family: 'Gaegu', cursive;
            }

            .panel-heading [data-toggle="collapse"]:after {
                font-family: 'Glyphicons Halflings';
                content: "\e072"; /* "play" icon */
                float: right;
                color: black;
                font-size: 24px;
                line-height: 22px;
                /* rotate "play" icon from > (right arrow) to down arrow */
                -webkit-transform: rotate(-90deg);
                -moz-transform: rotate(-90deg);
                -ms-transform: rotate(-90deg);
                -o-transform: rotate(-90deg);
                transform: rotate(-90deg);
            }

            .panel-heading [data-toggle="collapse"].collapsed:after {
                /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
                -webkit-transform: rotate(90deg);
                -moz-transform: rotate(90deg);
                -ms-transform: rotate(90deg);
                -o-transform: rotate(90deg);
                transform: rotate(90deg);
                color: black;
            }

            .panel-title{
                font-family: 'Gaegu', cursive;
                color:black;
            }

            .panel-body {
                font-family: 'Gaegu', cursive;
                font-size: 20px;
                color:black;
            }


            .panel-transparent {
                    background:rgba(255,255,255,0.5);
                    border: 1px solid;
                }

            .panel-transparent .panel-heading{
                background: rgba(122, 130, 136, 0.2)!important;
            }

            .panel-transparent .panel-body{
                background: rgba(46, 51, 56, 0.2)!important;
                
            }


            .auto-style6 {
                font-size: medium;
            }


        </style>

       <%-- <footer class="footer-distributed">

			<div class="footer-left">

				<h3>Company<span>logo</span></h3>

				<p class="footer-links">
					<a href="#">Home</a>
					·
					<a href="#">Blog</a>
					·
					<a href="#">Pricing</a>
					·
					<a href="#">About</a>
					·
					<a href="#">Faq</a>
					·
					<a href="#">Contact</a>
				</p>

				<p class="footer-company-name">Company Name &copy; 2015</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>
					<a href="#"><i class="fa fa-github"></i></a>

				</div>

			</div>

			<div class="footer-right">

				<p>Contact Us</p>

				<form action="#" method="post">

					<input type="text" name="email" placeholder="Email" />
					<textarea name="message" placeholder="Message"></textarea>
					<button>Send</button>

				</form>

			</div>

		</footer>--%>
    


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
