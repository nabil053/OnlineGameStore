<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertDeveloper.aspx.cs" Inherits="Online_Game_Store.insertDeveloper" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="insertDeveloperID" runat="server">
        <nav class="navbar navbar-light bg-transparent">   
    <div class="container" >
            <table style="margin:auto;">
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label class=" badge badge-dark" Font-Size="Larger" ID="LabelDeveloperHeader" runat="server" Font-Names="Eras Demi ITC" Text="Insert New Developer"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;<asp:Label ID="LabelDeveloperName" class="badge badge-light" Font-Size="Larger" runat="server" Font-Names="Eras Demi ITC" Text="Developer Name:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox class="form-control" ID="TextBoxDeveloperName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxDeveloperName" ErrorMessage="Empty Field!!!" Font-Names="Eras Demi ITC" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button class="btn btn-success" ID="ButtonInsertDeveloper" runat="server" Font-Names="Eras Demi ITC" OnClick="ButtonInsertDeveloper_Click" Text="Insert" Width="100px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="LabelDeveloperError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        </nav>
</asp:Content>
