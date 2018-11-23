<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactPage.aspx.cs" Inherits="Online_Game_Store.ContactPage" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="ContactPagesID" runat="server">
    <table class="nav-justified">
        
        <tr>
            <td style="width: 489px" >
                <table class="nav-justified" style="width: auto;text-align:center;">
                
                    <tr>
                        <td class="badge-secondary" style="width: 489px; font-size: x-large;"><strong>Contact Us </strong> </td>
            <td>&nbsp;</td>
                    </tr>
                    <tr>
                        
                        <td style="font-size: medium">SA Games. Where all platform Games are available To Buy!!!</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">Address:</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">ARA Bhaban, 39, Kazi Nazrul Islam Avenue Karwan Bazar, Dhaka-1215 Bangladesh </td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">Contact No:</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">If you have an urgent inquiry you may also contact us directly at: +88016xxxxxxxx (No phone orders please!)</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">For help with technical issues</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium">using the techshopbd website please email: feedback@sagames.com or send your question to: technicalsupport@sagames.com. </td>
                    </tr>
              
                </table>
            </td>
            <td>
                <table class="btn btn-success" style="text-align:center;">
                    <tr>
                        <td colspan="3" style="font-size: x-large"><strong>Submit your message</strong></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="font-size: medium"><strong>Please send your message below. We will get back to you at the earliest!</strong></td>
                    </tr>
                    <tr>
                        <td style="width: 90px">&nbsp;</td>
                        <td style="width: 280px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 90px; font-size: large; "><strong>Name: </strong><br /></td>
                        <td style="width: 280px">
                            <asp:TextBox class="form-control" ID="TextBoxCName" runat="server" Width="220px"></asp:TextBox>
                                <br />
                            </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCName" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 90px; font-size: large; "><strong>Subject: </strong><br /></td>
                        <td style="width: 280px">
                            <asp:TextBox class="form-control" ID="TextBoxCSubject" runat="server" Width="220px"></asp:TextBox>
                         <br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxCSubject" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 90px; font-size: large; "><strong>Email: </strong><br /></td>
                        <td style="width: 280px">
                            <asp:TextBox class="form-control" ID="TextBoxCEmail" runat="server" TextMode="Email" Width="220px"></asp:TextBox>
                         <br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxCEmail" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 90px; font-size: large; "><strong>Message: </strong><br /></td>
                        <td style="width: 280px">
                            <asp:TextBox class="form-control" ID="TextBoxCMessage" runat="server" Height="146px" TextMode="MultiLine" Width="267px"></asp:TextBox>
                            <asp:Label ID="LabelContactError" runat="server" Font-Names="Eras Demi ITC" Font-Size="15pt"></asp:Label>
                         <br />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxCMessage" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" Font-Size="12pt" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 90px">&nbsp;</td>
                        <td style="width: 280px">
                           
                            <asp:Button CssClass="btn btn-primary" ID="ButtonCSend" runat="server" Text="Send" Width="100px" OnClick="ButtonCSend_Click" />
                            <br />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 489px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
   


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