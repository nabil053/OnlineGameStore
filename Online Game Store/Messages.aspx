<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Online_Game_Store.Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="customer_name" HeaderText="customer_name" SortExpression="customer_name" />
                <asp:BoundField DataField="customer_email" HeaderText="customer_email" SortExpression="customer_email" />
                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                <asp:BoundField DataField="customer_contact" HeaderText="customer_contact" SortExpression="customer_contact" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="select m.Id,  m.customer_name, m.customer_email, m.subject, m.message, c.customer_contact FROM help_messages as m inner join  customer as c on m.customer_id=c.customer_id;"></asp:SqlDataSource>
    </form>
</body>
</html>
