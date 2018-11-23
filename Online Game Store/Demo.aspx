<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="Online_Game_Store.Demo1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/css/main.css" rel="stylesheet" runat="server"/>
    <%--<link rel="stylesheet" type="text/css" href="~/font-awesome/css/font-awesome.min.css" runat="server"/>--%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-grid.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-reboot.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-reboot.min.css"/>
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .anyClass {
  height:150px;
  overflow-y: scroll;
}
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
<body>
    <form id="form1" runat="server">
        
       
      
       
        
        <asp:TextBox ID="TextBoxTime" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <asp:Label ID="LabelTime" runat="server" Text="Label"></asp:Label>
        
       
      
       
        
    </form>
</body>
</html>
