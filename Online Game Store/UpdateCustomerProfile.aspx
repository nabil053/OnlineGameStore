<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCustomerProfile.aspx.cs" Inherits="Online_Game_Store.UpdateCustomerProfile" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="UpdateCProfileID" runat="server">
    <table style="margin:0px;font-family:Arial;width:1200px;border: 2px solid black;" align="center">
        
        <tr >
           
            
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="viewOrders" runat="server" Text="My Orders" Width="150px"  CausesValidation="false" OnClick="viewOrders_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button1" runat="server" Text="My Account" Width="150px" OnClick="Button1_Click" CausesValidation="false" />
            </td>
             <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-primary" ID="Button3" runat="server" Text="Promo Code" Width="150px" CausesValidation="false" OnClick="Button3_Click" />
            </td>
            <td class="auto-style3" style="border: 2px solid black;background-color:#1f1f1f;text-align: left; width: 164px;">
                <asp:Button class="btn btn-outline-danger" ID="Button2CustomerLogout" runat="server" Text="Logout" Width="150px" CausesValidation="false" OnClick="Button2CustomerLogout_Click"  />
            </td>

        </tr>
        <tr >
          <td class="container" style="margin:0px;border: 2px solid black; background-image:url('Images/profile_image.jpg'); text-align: center;" colspan="4" align="center">
                
                <div style="text-align: center">
                
                        <div style="text-align:center;">
                        <div style="width:50%; margin: 0 auto; text-align:left;">
                             <div class="container">
        <h1 style="color: #000000"><strong>Edit Profile</strong></h1>
        <div class="row">
            <!-- edit form column -->
            <div class="col-md-6 personal-info">
                <h3 style="color: #000000"><strong>Personal info</strong></h3>

                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-lg-3 control-label"><strong>Name:</strong></label></span>
                        <div class="col-lg-8">
                            <asp:TextBox id="fname" name="fname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                 <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-lg-3 control-label"><strong>Email:</strong></label></span>
                        <div class="col-lg-8">
                            <asp:TextBox id="email" runat="server" class="form-control" placeholder="email" type="email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email is not valid" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" Font-Strikeout="False" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-lg-3 control-label"><strong>Password:</strong></label></span>
                        <div class="col-lg-8">
                            <asp:TextBox id="password" type="password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-lg-3 control-label"><strong>Confirm Password:</strong></label></span>
                        <div class="col-lg-8">
                            <asp:TextBox id="con_password" type="password" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="con_password" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="con_password" ErrorMessage="Not Matched!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-md-3 control-label"><strong>Country:</strong></label></span>
                        <div class="col-md-8">
                            <asp:TextBox id="country" runat="server" class="form-control" placeholder="Country"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="country" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-md-3 control-label"><strong>City:</strong></label></span>
                        <div class="col-md-8">
                            <asp:TextBox id="city" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="city" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <span style="color: #000000">
                        <label class="col-md-3 control-label"><strong>Contact:</strong></label></span>
                        <div class="col-md-8">
                           <asp:TextBox id="contact" runat="server" class="form-control" placeholder="Contact"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="contact" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                            <span style="color: #000000">
                            <label class="col-md-3 control-label"><strong>Address:</strong></label></span>
                            <div class="col-md-8">
                               <asp:TextBox id="address" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="address" ErrorMessage="Empty Field Detected!!!" Font-Bold="True" Font-Names="Eras Demi ITC" Font-Size="15pt" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                                    <span style="color: #000000">
                                    <label class="col-md-3 control-label"><strong>Gender:</strong></label></span>
                                    <div class="col-md-8">
                                        <asp:RadioButton ID="male" class="form-control" runat="server" GroupName="measurementSystem" Text="Male"></asp:RadioButton>
                                        <asp:RadioButton  runat="server" ID="female" class="form-control" GroupName="measurementSystem" Text="Female"></asp:RadioButton>
                                    </div>
                                    </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label"></label>
                                        <div class="col-md-8">
                                            <br />
                                            <asp:Button id="Save_button" class="btn btn-default" runat="server" Text="Save changes" OnClick="Save_button_Click"  />
                                            <br /> <br />
                                            <%--<input type="reset" class="btn btn-default" id="Reset_button" value="Cancel"/>--%>
                                        </div>

                                    </div>
                 <br />
                            </div>
                        </div>
                    </div>    
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>
                            </div>
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
