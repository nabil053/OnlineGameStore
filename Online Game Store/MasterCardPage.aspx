<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterCardPage.aspx.cs" Inherits="Online_Game_Store.CreditCardPage" MasterPageFile="~/Login.Master" %>

<asp:Content ContentPlaceHolderID="ContentLoginHolderId" ID="MasterCardID" runat="server">
        <div class="container-fluid" style="background-color: lavender;">


            <div class="row">
                <div class="col-md-12">
                    <div class="masterCardSection" style="border: 2px solid black;">
                        <div class="row" style="margin-left:20px;">
                            <div class="col-sm-2">
                                <img style="width:100px; height:50px;" src="Images/mastercard_logo.png" class="img-fluid" />
                            </div>

                            <div class="col-sm-10">
                                <h2 class="h2">Mastercard Payment</h2>
                            </div>
                        </div>

                        <div class="row" style="margin-top:50px;">
                            <div class="col-sm-3">
                                <label for="card_number" style="text-align:left;">Card number:</label>
                            </div>

                            <div class="col-sm-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="card_number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top:50px;">
                            <div class="col-sm-3">
                                <label for="cardholder_name" style="text-align:left;">Cardholder name:</label>
                            </div>

                            <div class="col-sm-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="cardholder_name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top:50px;">
                            <div class="col-sm-3">
                                <label for="billing_address" style="text-align:left;">Billing Address:</label>
                            </div>

                            <div class="col-sm-9">
                                <asp:TextBox runat="server" CssClass="form-control" ID="billing_address"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" style="margin-top:50px; margin-left:0px;">
                            <div class="col-sm-4">
                                <asp:TextBox runat="server" CssClass="monthYear" ID="month" placeholder="MM" MaxLength="2"></asp:TextBox> /
								<asp:TextBox runat="server" CssClass="monthYear" ID="year" placeholder="YY" MaxLength="2"></asp:TextBox>
								<asp:TextBox runat="server" CssClass="cvc" ID="cvc" placeholder="CVC" MaxLength="3"></asp:TextBox>
                            </div>

                            <div class="col-sm-8">
                                <asp:Button runat="server" ID="submitButton" CssClass="btn-primary submitButtonDesignClass" Text="Submit" OnClick="submitButton_Click"/>
                                <div visible="false" id="alertBox" runat="server" class="alert alert-danger alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <asp:Label ID="alertLabel" runat="server"></asp:Label><asp:Label ID="messageLabel" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
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