<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="Online_Game_Store.Registration" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="ContentRegisterID" runat="server">
    <nav class="navbar navbar-light bg-light">   
    <div class="container">

              <table  class="table table-dark table-striped" style="text-align:center;">
                <tr align="center">
                    <td class="auto-style12" style="width: 362px">&nbsp;</td>
                    <td class="auto-style6" style="color:#ffffff;text-align:center;font-size:30px;margin: 5px 5px 5px; width: 291px;">Register</td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="text-right"  style="width: 362px; height: 26px">Name</td>
                    <td class="auto-style4" style="width: 291px; height: 26px">
                        <asp:TextBox class="form-control" ID="TextBoxName" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left" style="height: 26px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Required Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Email</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxEmail" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Required Email" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Password</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxPass" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxPass" ErrorMessage="Required Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Re-Password</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxRePass" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxRePass" ErrorMessage="Required Confirm Password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxPass" ControlToValidate="TextBoxRePass" ErrorMessage="Password Not matched" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Country</td>
                    <td class="auto-style6" style="width: 291px">
                        <asp:DropDownList ID="DropDownListCountry" class="dropdown-header" runat="server" Height="50px" Width="254px">
                            <asp:ListItem >Select a Country</asp:ListItem>
                            <asp:ListItem>Bangladesh</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>Japan</asp:ListItem>
                            <asp:ListItem>Germany</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownListCountry" ErrorMessage="Required Country" ForeColor="Red" InitialValue="Select a Country"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr align="center">
                    <td class="text-right" style="width: 362px">Select a security question</td>
                    <td class="auto-style6" style="width: 291px">
                        <asp:DropDownList ID="DropDownSQ" class="dropdown-header" runat="server" Height="50px" Width="254px">
                            <asp:ListItem >Select a Question</asp:ListItem>
                            <asp:ListItem>what is your favorite social media website?</asp:ListItem>
                            <asp:ListItem>What was your favorite place to visit as a child?</asp:ListItem>
                            <asp:ListItem>Who is your favorite actor, musician, or artist?</asp:ListItem>
                            <asp:ListItem>What is the name of your favorite pet?</asp:ListItem>
                            <asp:ListItem>In what city were you born?</asp:ListItem>
                            <asp:ListItem>What is your favorite movie?</asp:ListItem>
                            <asp:ListItem>What is your favorite color?</asp:ListItem>
                            <asp:ListItem>what is your favorite website?</asp:ListItem>
                            <asp:ListItem>what is your favorite online platform?</asp:ListItem>
                            <asp:ListItem>What is your favorite team?</asp:ListItem>
                            <asp:ListItem>What is your favorite movie?</asp:ListItem>
                            <asp:ListItem>In what town was your first job?</asp:ListItem>
                            <asp:ListItem>What was your favorite food as a child?</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DropDownSQ" ErrorMessage="Required Security Question" ForeColor="Red" InitialValue="Select a Question"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr align="center">
                    <td class="text-right" style="width: 362px">Answer</td>
                    <td class="auto-style6" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxSCAnswer" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxSCAnswer" ErrorMessage="Required Answer" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">City</td>
                    <td class="auto-style9" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxCity" runat="server" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxCity" ErrorMessage="Required City" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Mobile</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxMobile" runat="server" TextMode="Phone" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxMobile" ErrorMessage="Required Mobile No" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Address</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:TextBox class="form-control" ID="TextBoxAddress" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxAddress" ErrorMessage="Required Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="text-right" style="width: 362px">Gender</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:RadioButtonList class="radio" ID="RadioButtonListGender" runat="server" Width="254px">
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="text-left">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RadioButtonListGender" ErrorMessage="Required Gender Selection" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" style="width: 362px">&nbsp;</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:Button ID="RegisterButton" class="btn btn-success" runat="server" OnClick="RegisterButton_Click" Text="Register" Width="250px" Height="40px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" style="width: 362px">&nbsp;</td>
                    <td class="auto-style4" style="width: 291px">
                        <asp:HyperLink ID="HyperLink1" class="btn btn-outline-primary" runat="server" NavigateUrl="~/CustomerLogin.aspx">Already have an account? Login</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td class="auto-style2" style="width: 362px">&nbsp;</td>
                    <td class="auto-style4" style="width: 291px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        </nav>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeaderPlaceHolder" ID="HeaderPlaceID" runat="server">

    <div>
            <asp:DataList ID="DataListHeaderImage" runat="server" DataSourceID="SqlDataSourceHeaderImage" CellPadding="0" HorizontalAlign="Left" RepeatDirection="Horizontal" >
                <ItemTemplate>
                   <a href="Default.aspx"> <asp:Image class="rounded float-left" ID="Image1" runat="server" Height="180px" ImageUrl='<%# Eval("header_image") %>' Width="180px" /><a/>
                    <br />
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceHeaderImage" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [header_image] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>                 
</asp:Content>
<asp:Content ContentPlaceHolderID="BannerPlaceHolder" ID="BannerPlaceId" runat="server">
     
        <div>
            <asp:DataList ID="DataListBannerImage" runat="server" DataSourceID="SqlDataSourceBannerImage" CellPadding="0" HorizontalAlign="right" RepeatDirection="Horizontal" >
                <ItemTemplate>
                    <asp:Image  class="rounded float-right" ID="Image1" runat="server" ImageUrl='<%# Eval("ads_cover_image") %>' height="150px" Width="800px" />
                    <br />
                        </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceBannerImage" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>" SelectCommand="SELECT [ads_cover_image] FROM [Others] WHERE ([other_id] = @other_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="20" Name="other_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>