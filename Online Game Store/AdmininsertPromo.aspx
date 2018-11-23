<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmininsertPromo.aspx.cs" Inherits="Online_Game_Store.AdmininsertPromo" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="InsertPromoID" runat="server">
        <div>
            <table class="table table-dark table-striped" style="margin:auto;">
                <tr>
                    <td class="auto-style12" style="width: 259px;">&nbsp;</td>
                    <td class="btn btn-light" style="color:#000000;text-align:center;font-size:30px;margin: 5px 5px 5px; width: 291px;">Insert Promo Code</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Code</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxCode" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCode" ErrorMessage="Required Code" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
               
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Discount</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxDiscount" runat="server" TextMode="Number" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxDiscount" ErrorMessage="Required Discount" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Expire Date</td>
                    <td class="auto-style7">
                        <asp:TextBox class="form-control" ID="TextBoxGameEDate" runat="server" Height="31px" TextMode="Date" Width="280px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxGameEDate" ErrorMessage="Required Expire Date" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="auto-style5" >&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="LabelPromoInsertError" runat="server" Font-Names="Eras Demi ITC" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Button class="btn btn-success" ID="ButtonPromoInsert" runat="server" Text="Insert Promo" Width="150px" OnClick="ButtonPromoInsert_Click"/>
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
