<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertProduct.aspx.cs" Inherits="Online_Game_Store.InsertProduct" MasterPageFile="~/AdminPanel.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="InsertProductID" runat="server">
        <div>
            <table class="table table-dark table-striped" style="margin:auto;">
                <tr>
                    <td class="auto-style12" style="width: 259px;">&nbsp;</td>
                    <td class="btn btn-light" style="color:#000000;text-align:center;font-size:30px;margin: 5px 5px 5px; width: 291px;">Insert Post</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Title</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxGameTitle" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxGameTitle" ErrorMessage="Required Game Title" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Category</td>
                    <td class="auto-style4" style="height: 26px">
                        <asp:DropDownList class="dropdown-header" Height="50px" Width="280px" ID="DropDownListGameCategory" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="category_title" DataValueField="category_title">
                            <asp:ListItem>Select A Category</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="height: 26px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required To Select Game Category" ForeColor="Red" ControlToValidate="DropDownListGameCategory" InitialValue="Select A Category"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Platforms</td>
                    <td class="auto-style4">
                        
                        <asp:DropDownList class="dropdown-header" ID="DropDownListGamePlatform" runat="server" DataSourceID="SqlDataSourcePlatform" DataTextField="platform_title" DataValueField="platform_title" Height="50px" Width="280px">
                        </asp:DropDownList>
                        
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownListGamePlatform" ErrorMessage="Required To Select Game Platform" ForeColor="Red" InitialValue="Select A Platform"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Developer</td>
                    <td class="auto-style4">
                        <asp:DropDownList class="dropdown-header" Height="50px" Width="280px" ID="DropDownListGameDevelopers" runat="server" DataSourceID="SqlDataSourceDevelopers" DataTextField="developer_title" DataValueField="developer_title">
                            <asp:ListItem>Select A Developer</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required To Select Game Developers" ForeColor="Red" ControlToValidate="DropDownListGameDevelopers" InitialValue="Select A Developer"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Image</td>
                    <td class="auto-style4">
                        <asp:FileUpload class="btn btn-outline-light" ID="FileUploadGameCoverImage" runat="server" Width="280px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUploadGameCoverImage" ErrorMessage="Required To Upload Game Cover Image" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">price</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxGamePrice" runat="server" TextMode="Number" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxGamePrice" ErrorMessage="Required Game Price" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Description</td>
                    <td class="auto-style7">
                        <asp:TextBox class="form-control" ID="TextBoxGameDescription" runat="server" Height="160px" TextMode="MultiLine" Width="280px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxGameDescription" ErrorMessage="Required Game Description" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Graphics Card</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxGraphicsCard" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxGraphicsCard" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">CPU</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxCPU" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBoxCPU" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">RAM SIZE</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxRamSize" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBoxRamSize" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">OS Version</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxOs" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBoxOs" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">Available Quantity</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxQuantity" runat="server" Width="280px" TextMode="Number"></asp:TextBox>
                    </td>
                    <td>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBoxQuantity" ErrorMessage="Required!!!" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">keywords</td>
                    <td class="auto-style4">
                        <asp:TextBox class="form-control" ID="TextBoxGameKeywords" runat="server" Width="280px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxGameKeywords" ErrorMessage="Required Game Related Keywords" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">ScreenShot 1</td>
                    <td class="auto-style4">
                        <asp:FileUpload class="btn btn-outline-light" ID="FileUploadGameSS1" runat="server"  Width="280px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileUploadGameSS1" ErrorMessage="Required To Upload Game ScreenShot 1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">ScreenShot 2</td>
                    <td class="auto-style4">
                        <asp:FileUpload class="btn btn-outline-light" ID="FileUploadGameSS2" runat="server" Width="280px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FileUploadGameSS2" ErrorMessage="Required To Upload Game ScreenShot 2" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 259px; height: 26px">ScreenShot 3</td>
                    <td class="auto-style4">
                        <asp:FileUpload class="btn btn-outline-light" ID="FileUploadGameSS3" runat="server" Width="280px" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="FileUploadGameSS3" ErrorMessage="Required To Upload Game ScreenShot 3" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="auto-style5" style="width: 259px">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button class="btn btn-success" ID="ButtonInsert" runat="server" Text="Insert Post" Width="150px" OnClick="ButtonInsert_Click" />
                        
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" style="width: 259px">
                        <asp:SqlDataSource ID="SqlDataSourcePlatform" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [platform_title] FROM [platforms]"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style4">
                        <asp:Label ID="LabelProductInsertError" runat="server" Font-Names="Eras Demi ITC" ForeColor="Red"></asp:Label>
                        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [category_title] FROM [categories]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" style="width: 259px">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:SqlDataSource ID="SqlDataSourceDevelopers" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [developer_title] FROM [developers]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>
