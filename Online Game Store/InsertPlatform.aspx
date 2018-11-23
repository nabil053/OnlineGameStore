<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertPlatform.aspx.cs" Inherits="Online_Game_Store.InsertPlatform" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="insertPlatformID" runat="server">
    <nav class="navbar navbar-light bg-transparent">   
    <div class="container" >
            <table style="margin:auto;">
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7">
                        <asp:Label class=" badge badge-dark" Font-Size="Larger" ID="LabelPlatformHeader" runat="server" Font-Names="Eras Demi ITC" Text="Insert New Platform"></asp:Label>
                    </td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="LabelPlatformName" class="badge badge-light" Font-Size="Larger" runat="server" Font-Names="Eras Demi ITC" Text="Platform Name:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox class="form-control" ID="TextBoxPlatformName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxPlatformName" ErrorMessage="Empty Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button class="btn btn-success" ID="ButtonPlatform" runat="server" Font-Names="Eras Demi ITC" Text="Insert" Width="100px" OnClick="ButtonPlatform_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Label ID="LabelcPlatformError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
    </div>
        </nav>
</asp:Content>
