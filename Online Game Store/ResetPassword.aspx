<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Online_Game_Store.ResetPassword" MasterPageFile="~/Home.Master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="ResetPassID" runat="server">
        <nav class="navbar navbar-light bg-light">   
    <div class="container">
            <table class="table table-dark table-striped">
            <tr>
                <td class="auto-style2" style="width: 268px">&nbsp;</td>
                <td class="auto-style4" style="color: #ffffff; text-align: center; font-size: 25px; margin: 5px 5px 5px; width: 438px;">Reset Your Password!!!</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 268px; text-align: right">Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxRPass" runat="server" CssClass="form-control" Height="28px" Width="311px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxRPass" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="width: 268px; text-align: right">Confirm Password</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBoxRCPass" runat="server" CssClass="form-control" Height="29px" Width="309px" TextMode="Password"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxRCPass" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxRPass" ControlToValidate="TextBoxRCPass" ErrorMessage="Not Matched!!!" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 268px">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Reset" Width="117px" OnClick="Button1_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 268px">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 268px">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
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