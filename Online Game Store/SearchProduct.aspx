<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchProduct.aspx.cs" Inherits="Online_Game_Store.SearchProduct" MasterPageFile="~/Home.Master" %>

<asp:Content ContentPlaceHolderID="SlidePlaceHolder1" ID="SlideID" runat="server">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="Images/Sildes/Batman.png" alt="First slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/Cod.png" alt="Second slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/Fifa.png" alt="Third slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/Kof.png" alt="Fourth slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/Moto_gp.png" alt="Fifth slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/Nfs_the_run.png" alt="Sixth slide"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="Images/Sildes/wwe.png" alt="Seventh slide"/>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </asp:Content>

<asp:Content ID="DevelopersID" ContentPlaceHolderID="DevelopersPlaceHolder2" runat="server">
    <%--<h2 style="font-size:10px;text-align:center; background-color:#000000;color:#ffffff;">Developers</h2>--%>
    <div id="list-example" class="list-group">
  <a class="btn btn-success" href="#list-item-1">Developers</a>
  <a class="btn btn-outline-dark" href="#list-item-2">2kGames</a>
  <a class="btn btn-outline-dark" href="#list-item-3">Activision</a>
  <a class="btn btn-outline-dark" href="#list-item-4">Capcom</a>
 <a class="btn btn-outline-dark" href="#list-item-5">Electronic Arts</a>
 <a class="btn btn-outline-dark" href="#list-item-6">Gameloft</a>
 <a class="btn btn-outline-dark" href="#list-item-7">Glu Mobile</a>
        <a class="btn btn-outline-dark" href="#list-item-6">Maxis Softwares</a>
 <a class="btn btn-outline-dark" href="#list-item-7">Microsoft Studio</a>
</div>
<%--<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example">
  <h4 id="list-item-1">Item 1</h4>
  <p>...</p>
  <h4 id="list-item-2">Item 2</h4>
  <p>...</p>
  <h4 id="list-item-3">Item 3</h4>
  <p>...</p>
  <h4 id="list-item-4">Item 4</h4>
  <p>...</p>
</div>--%>

</asp:Content>

<asp:Content ID="contentID" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav class="navbar navbar-light bg-light">



      
</nav>
</asp:Content>
