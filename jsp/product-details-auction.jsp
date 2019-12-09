<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>SKKU Flea Market | Product Details</title>

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/css/mobile-nav-header.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/product-details-auction.css">
  </head>
  <body>
  <%@ include file="header.jsp" %>
    <div class="wrapper">
      <div class="prod-outline">
        <div class="product">
          <img class="product-left" src="img/product-img/bicycle.jpeg" alt="bicyle">
          <div class="product-right">
            <div class="prod-header">
              Product Name
            </div>
            <div class="prod-info">
              <div class="prod-seller">
                Seller/Phone Number
              </div>
              <div class="remain-time">
                Remaining time
              </div>
              <div class="current-price">
                Current Product Price
              </div>
              <div class="prod-date">
                Trading Place
              </div>
            </div>
            <div class="prod-btn-lst">
              <button class="prod-wish-list-btn" title="Add to Wish list">
              </button>
              <form class="prod-bid-lst" action="http://localhost:8080/form.jsp" method="post">
                <div><input type="text" name="" value="" placeholder="Type your Bid price"></div>
                <div><button class="bid"type="submit" name="button">BID!</button></div>
              </form>
            </div>
          </div>
        </div>
        <div class="prod-detail">
          <div class="tab">
            <ul class="tab-title">
              <li name="detail"class="active" data-tab="con1">Product Detail</li>
              <li name="auction" data-tab="con2">Auction Detail</li>
            </ul>
            <ul class="tab-content">
              <li class="content-detail active" id="con1">
                <div class="detail-item">
                  <img class="prod-detail-img" src="bicycle2.jpeg" alt="bicycle"> <br><br>
                  <img class="prod-detail-img" src="bicycle2.jpeg" alt="bicycle"> <br><br>
                  <img class="prod-detail-img" src="bicycle2.jpeg" alt="bicycle"> <br><br>
                  <img class="prod-detail-img" src="bicycle2.jpeg" alt="bicycle"> <br><br>
                  <div classs="prod-detail-txt">
                    <p>설명을 적어주세용</p>
                  </div>
                </div>
              </li>
              <li class="content-detail" id="con2">
                Seller ID :
                Phone Number :
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>

  <!-- ##### Footer Area Start ##### -->
  <footer class="footer_area clearfix">
      <div class="container">
          <div class="row align-items-center">
              <!-- Single Widget Area -->
              <div class="col-12 col-lg-4">
                  <div class="single_widget_area">
                      <!-- Logo -->
                      <div class="footer-logo mr-50">
                          <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                      </div>
                      <!-- Copywrite Text -->
                      <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with WebProgrammingClas
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                  </div>
              </div>
              <!-- Single Widget Area -->
              <div class="col-12 col-lg-8">
                  <div class="single_widget_area">
                      <!-- Footer Menu -->
                      <div class="footer_menu">
                          <nav class="navbar navbar-expand-lg justify-content-end">
                              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                              <div class="collapse navbar-collapse" id="footerNavContent">
                                  <ul class="navbar-nav ml-auto">
                                      <li class="nav-item active">
                                          <a class="nav-link" href="index.html">Home</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="Product_list_seller.html">Product List (Seller)</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="product-details.html">나중에 카테고리 완전히 정해지면 고침</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="cart.html">Cart</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="checkout.html">Checkout</a>
                                      </li>
                                  </ul>
                              </div>
                          </nav>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </footer>
  <!-- ##### Footer Area End ##### -->


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
     <script src="js/product.js"></script>
     <script type="text/javascript" src="js/mobile-nav-header.js">

     </script>
    </body>
</html>
