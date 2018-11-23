<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="Online_Game_Store.ViewProduct" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="showProductsID" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSourceShowProducts" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT * FROM [products]" >
                
            </asp:SqlDataSource>
            <asp:GridView  ID="GridViewViewProduct" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="product_id"  ForeColor="#333333" AllowPaging="True" AllowSorting="True" CaptionAlign="Top" Font-Names="Eras Demi ITC" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" HorizontalAlign="Center" UseAccessibleHeader="False" style="margin-bottom: 2px" OnPageIndexChanging="GridViewViewProduct_PageIndexChanging" OnRowCancelingEdit="GridViewViewProduct_RowCancelingEdit" OnRowEditing="GridViewViewProduct_RowEditing" OnRowUpdating="GridViewViewProduct_RowUpdating" OnRowDeleting="GridViewViewProduct_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Product ID">
                        <EditItemTemplate>
                            <asp:Label ID="LabelPIds" runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPId" runat="server" Text='<%# Eval("product_id") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Platform">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxPlatform" runat="server" Text='<%# Eval("product_platform") %>' Width="200px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPPlatform" runat="server" Text='<%# Eval("product_platform") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxCategory" runat="server" Text='<%# Eval("product_category") %>' Width="200px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPCat" runat="server" Text='<%# Eval("product_category") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Developers">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxDeveloper" runat="server" Text='<%# Eval("product_developers") %>' Width="200px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPDev" runat="server" Text='<%# Eval("product_developers") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxTitle" runat="server" ToolTip="Product Title" Width="200px" Text='<%# Eval("product_title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPTitle" runat="server" Text='<%# Eval("product_title") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxPrice" runat="server" TextMode="Number" ToolTip="Product Price" Width="200px" Text='<%# Eval("product_price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPPrice" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxDescription" runat="server" Height="100px" TextMode="MultiLine" Width="200px" Text='<%# Eval("product_description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPDes" runat="server" Text='<%# Eval("product_description") %>' Width="200px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cover">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadCover" runat="server" />
                            <asp:Label ID="LabelLinkCover" runat="server" Text='<%# Eval("product_image") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="ImagePCover" runat="server" ImageUrl='<%# Eval("product_image") %>' Height="100px" Width="100px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Keyword">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxKeyword" runat="server" Height="100px" TextMode="MultiLine" Width="200px" Text='<%# Eval("product_keyword") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPKeyword" runat="server" Text='<%# Eval("product_keyword") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ScreenShot1">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadSS1" runat="server" />
                            <asp:Label ID="LabelLinkSS1" runat="server" Text='<%# Eval("product_ss1") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="ImagePSS1" runat="server" ImageUrl='<%# Eval("product_ss1") %>' Height="100px" Width="200px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ScreenShot2">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadSS2" runat="server" />
                            <asp:Label ID="LabelLinkSS2" runat="server" Text='<%# Eval("product_ss2") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="ImagePSS2" runat="server" ImageUrl='<%# Eval("product_ss2") %>' Height="100px" Width="200px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ScreenShot3">
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadSS3" runat="server" />
                            <asp:Label ID="LabelLinkSS3" runat="server" Text='<%# Eval("product_ss3") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="ImageSS3" runat="server" ImageUrl='<%# Eval("product_ss3") %>' Height="100px" Width="200px" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Graphics Card">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxGraphics" runat="server" Width="200px" Text='<%# Eval("product_graphics_card") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPGC" runat="server" Text='<%# Eval("product_graphics_card") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CPU">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxCpu" runat="server" Width="200px" Text='<%# Eval("product_cpu") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPCpu" runat="server" Text='<%# Eval("product_cpu") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="RAM">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxRam" runat="server" Width="200px" Text='<%# Eval("product_ram") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPRam" runat="server" Text='<%# Eval("product_ram") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OS">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxOs" runat="server" Width="200px" Text='<%# Eval("product_os") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPOs" runat="server" Text='<%# Eval("product_os") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBoxQuantity" runat="server" TextMode="Number" Width="200px" Text='<%# Eval("product_quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelPQty" runat="server" Text='<%# Eval("product_quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
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