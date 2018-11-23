<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertCategory.aspx.cs" Inherits="Online_Game_Store.insertCategory" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="insertCategoryID" runat="server">
    <nav class="navbar navbar-light bg-transparent">   
    <div class="container" >
            <table style="margin:auto;">
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7">
                        <asp:Label class=" badge badge-dark" Font-Size="Larger" ID="LabelCategoryHeader" runat="server" Font-Names="Eras Demi ITC" Text="Insert New Category"></asp:Label>
                    </td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="LabelCategoryName" class="badge badge-light" Font-Size="Larger" runat="server" Font-Names="Eras Demi ITC" Text="Category Name:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox class="form-control" ID="TextBoxCategoryName" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCategoryName" ErrorMessage="Empty Field!!!" Font-Names="Eras Demi ITC" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button class="btn btn-success" ID="Button1" runat="server" Font-Names="Eras Demi ITC" OnClick="Button1_Click" Text="Insert" Width="100px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Label ID="LabelcCategoryError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
    </div>
        </nav>
</asp:Content>
