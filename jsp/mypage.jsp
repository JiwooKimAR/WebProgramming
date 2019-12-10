<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%
int classification;
String user_name = ""; 
String id=session.getAttribute("user_name").toString();
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
	pst.setString(1,id);
	ResultSet rs = pst.executeQuery();
	if (rs.next()) {
		classification = rs.getInt("classification");
		user_name = rs.getString("name");
		// classification: 0(admin) / 1(normal user)
	}
}catch(Exception e){
	out.println(e.toString());
}
%>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>SKKU Flea Market | My Page</title>

    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="css/mypage.css">

  </head>
  <body>
  <%@ include file="header.jsp" %>
    <div class="wrap">
      <div class="title pad">
        <div class="title-inner">
          <div class="logout">
            <a href="logout-function.jsp" name="button">Logout</a>
          </div>
          <div class="mypage">
            <p class="mypage-inner">My page</p>
          </div>
        </div>

      </div>
      <div class="wrap-inner">
        <div class="user-info outer pad">
          <p class="user-info-title">User Information</p>
          <div class="user-info-inner">
            <div class="con">
              NAME : <%=user_name%>
            </div>
            <div class="con">
              ID : <%=id%>
            </div>
            <br>
            <button class="chng-usr-info" type="button" name="button">Change User Info</button>
            </div>
          </div>
          <div class="prod-bid pad outer">
            <p class="user-info-title">Bid product</p>
            <div class="prod-bid-lst inner">
              
            </div>
          </div>
          <div class="prod-wish pad outer">
            <p class="user-info-title">Cart list</p>
            <div class="uploaded-prod-lst inner">
              
            </div>
          </div>
          <div class="prod-wish pad outer">
            <p class="user-info-title">Wish list</p>
            <div class="uploaded-prod-lst inner">
              
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
    <!-- Popper j
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <script src="js/active.js"></script>
     </script>
  </body>


  </script>
</html>
