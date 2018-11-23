<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertFAQs.aspx.cs" Inherits="Online_Game_Store.insertFAQs" MasterPageFile="~/AdminPanel.Master" %>


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
                        <asp:Label ID="LabelPlatformName" class="badge badge-light" Font-Size="Larger" runat="server" Font-Names="Eras Demi ITC" Text="FAQ Question:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox class="form-control" ID="TextBoxfaqQuestion" runat="server" Width="194px" Height="151px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxfaqQuestion" ErrorMessage="Empty Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label1" class="badge badge-light" Font-Size="Larger" runat="server" Font-Names="Eras Demi ITC" Text="FAQ Answer:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox class="form-control" ID="TextBoxfaqAnswer" runat="server" Width="196px" Height="160px" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxfaqAnswer" ErrorMessage="Empty Field" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button class="btn btn-success" ID="ButtonInsertFaq" runat="server" Font-Names="Eras Demi ITC" Text="Insert" Width="100px" OnClick="ButtonInsertFaq_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="height: 26px"></td>
                    <td class="auto-style5" style="height: 26px">
                        <asp:Label ID="LabelcFaQError" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td style="height: 26px"></td>
                </tr>
            </table>
    </div>
        </nav>
</asp:Content>
