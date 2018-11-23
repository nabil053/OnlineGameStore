<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Online_Game_Store.Login" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="LoginID" runat="server">
    <nav class="navbar navbar-light bg-light">   
    <div class="container">
    <table class="table table-dark table-striped">
        <tr>
            <td class="auto-style5" style="width: 311px"></td>
            <td class="auto-style6" style="color:#ffffff;text-align:center;font-size:25px;margin: 5px 5px 5px; width: 290px;">Login</td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="text-right" style="width: 311px" >Email:</td>
            <td class="auto-style4">
                <asp:TextBox class="form-control" ID="TextBoxLEmail" runat="server" Width="271px" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxLEmail" ErrorMessage="Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLEmail" ErrorMessage="Required Email" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 311px">Password:</td>
            <td class="auto-style4">
                <asp:TextBox class="form-control" ID="TextBoxLPass" runat="server" Width="270px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxLPass" ErrorMessage="Required Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td>

            </td>

            <td>

                <asp:Label ID="LabelCustomerError" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="width: 311px">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button class="btn btn-success" ID="LoginButton" runat="server" OnClick="LoginButton_Click" Text="Login" Width="200px" Height="40px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="width: 311px">&nbsp;</td>
            <td class="auto-style4">
                <asp:HyperLink class="btn btn-outline-primary" ID="RegNow" runat="server" EnableTheming="False" NavigateUrl="~/ForgetPassword.aspx">Forgotten Password!!!</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="width: 311px">&nbsp;</td>
            <td class="auto-style4">
                <asp:HyperLink class="btn btn-outline-primary" ID="HyperLink1" runat="server" EnableTheming="False" NavigateUrl="~/CustomerRegistration.aspx">Register Now!!!</asp:HyperLink>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
        </nav>
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