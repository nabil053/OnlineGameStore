﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPlatform.aspx.cs" Inherits="Online_Game_Store.ViewPlatform" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="viewPlatformId" runat="server">
        <div  class="container">
            <asp:SqlDataSource ID="SqlDataSourcePlatformAll" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT * FROM [platforms]" UpdateCommand="update [platforms] set [platform_title]=@platform_title where [platform_id]=@platform_id" DeleteCommand="delete from [platforms] where [platform_id]=@platform_id"></asp:SqlDataSource>
            <asp:GridView ID="GridViewPlatforms" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" DataKeyNames="platform_id" DataSourceID="SqlDataSourcePlatformAll" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="platform_id" HeaderText="platform_id" InsertVisible="False" ReadOnly="True" SortExpression="platform_id" />
                    <asp:BoundField DataField="platform_title" HeaderText="platform_title" SortExpression="platform_title" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
</asp:Content>