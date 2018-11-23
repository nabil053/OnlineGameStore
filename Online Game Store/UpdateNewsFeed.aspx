<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateNewsFeed.aspx.cs" Inherits="Online_Game_Store.UpdateNewsFeed" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="updateNewsFeedID" runat="server">
        <table style="margin:auto;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label class=" badge badge-dark" Font-Size="Larger" ID="LabelNewsFeed" runat="server" Text="Update News Feed"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox class="form-control" ID="TextBoxNewsFeed" runat="server" Height="136px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" ForeColor="Red" ControlToValidate="TextBoxNewsFeed"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>

                    <asp:Label ID="LabelNewFeed2" runat="server"></asp:Label>

                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button class="btn btn-success" ID="ButtonUpdateNewsFeed" runat="server" Text="Update News Feed" Width="200px" OnClick="ButtonUpdateNewsFeed_Click1" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Content>