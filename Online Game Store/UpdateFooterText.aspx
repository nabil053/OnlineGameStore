<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateFooterText.aspx.cs" Inherits="Online_Game_Store.UpdateFooterText" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="updateFooterTextID" runat="server">
        <table style="margin:auto;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Label class=" badge badge-dark" Font-Size="Larger" ID="LabelFooterText" runat="server" Text="Update Footer Text"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:TextBox class="form-control" ID="TextBoxFooterText" runat="server" Height="136px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorfooter1" runat="server" ErrorMessage="Empty!!!" Font-Names="Eras Demi ITC" ForeColor="Red" ControlToValidate="TextBoxFooterText"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>

                    <asp:Label ID="LabelFooterTxtError" runat="server"></asp:Label>

                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button class="btn btn-success" ID="ButtonFooterText" runat="server" Text="Update Footer Text" Width="200px" OnClick="ButtonFooterText_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Content>