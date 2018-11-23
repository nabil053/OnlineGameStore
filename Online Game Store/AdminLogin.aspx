<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Online_Game_Store.AdminLogin" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ID="adminLogin" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <nav class="navbar navbar-light bg-transparent">   
    <div class="container" >
    <table  style="margin:auto;" >
        <tr  >
            <td class="auto-style5" style="width: 93px"></td>
            <td class="auto-style6" style="color:#000000;text-align:center;font-size:25px;margin: 5px 5px 5px; width: 175px;">Admin Login</td>
            <td class="auto-style7"></td>
        </tr>
        <tr>
            <td class="text-right" style="width: 93px" >Email:</td>
            <td class="auto-style4" style="width: 175px">
                <asp:TextBox class="form-control" ID="AdminEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AdminEmail" ErrorMessage="Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AdminEmail" ErrorMessage="Required Email" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 93px">Password:</td>
            <td class="auto-style4" style="width: 175px">
                <asp:TextBox class="form-control" ID="AdminPass" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AdminPass" ErrorMessage="Required Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>

            </td>

            <td>

                <asp:Label ID="LabelAdminError" runat="server" ForeColor="Red"></asp:Label>

            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td class="auto-style3" style="width: 93px">&nbsp;</td>
            <td class="auto-style4" style="width: 175px">
                
                <asp:Button ID="Button1" runat="server" class="btn btn-outline-warning" OnClick="Button1_Click" Text="Login" Width="114px" />
                
            </td>
            <td>&nbsp;</td>
        </tr>
        
    </table>
        </div>
        </nav>
</asp:Content>