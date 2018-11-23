<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Online_Game_Store.ForgetPassword" MasterPageFile="~/Home.Master" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="ForgetPassID" runat="server">
        <nav class="navbar navbar-light bg-light">   
    <div class="container">
            <table class="table table-dark table-striped">
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="color: #ffffff; text-align: left; font-size: 25px; margin: 5px 5px 5px; width: 438px;">Forgot Your Password?</td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">Enter the e-mail address associated with your account.</td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
              
                <tr>
                    <td class="auto-style5" style="text-align: right; width: 199px;">E-Mail Address</td>
                    <td class="auto-style4" style="width: 438px">
                        <asp:TextBox ID="TextBoxFEmail" runat="server" Height="31px" Width="403px" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td style="text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxFEmail" ErrorMessage="Required Email!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxFEmail" ErrorMessage="Enter Valid Email Address!!!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        <asp:Label ID="LabelFEmailError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="width: 438px">
                        <asp:Button CausesValidation="false" ID="ButtonBack" runat="server" Text="Back" Width="109px" CssClass="btn btn-warning" OnClick="ButtonBack_Click" />
                        <asp:Button  ID="ButtonSubmit" runat="server" CssClass="btn btn-success" OnClick="ButtonSubmit_Click" Text="Submit" Width="95px" style="margin-left: 192px" />
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        &nbsp;</td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="width: 438px;">
                        <asp:Label ID="LabelSC" runat="server" Font-Size="X-Large" Visible="False">Answer Security Question</asp:Label>
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        <asp:Label ID="LabelSCQ" runat="server" Font-Size="Medium" Visible="False"></asp:Label>
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        <asp:TextBox ID="TextBoxA" runat="server" Height="30px" Width="419px" Visible="False" ForeColor="#333300"></asp:TextBox>
                    </td>
                    <td style="text-align: left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxA" ErrorMessage="Required !!!" ForeColor="Red" Visible="False"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        <asp:Label ID="LabelFQuestionError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: left; width: 199px;">&nbsp;</td>
                    <td class="auto-style4" style="text-align: left; width: 438px;">
                        <asp:Button  ID="ButtonNext" runat="server" CssClass="btn btn-success" OnClick="ButtonNext_Click" Text="Next" Width="95px" style="margin-left: 0px" Visible="False" />
                    </td>
                    <td style="text-align: left">&nbsp;</td>
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