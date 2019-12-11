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
  <%@ include file="header.jsp"%>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.util.Date" %>
  <%@ page import="java.text.SimpleDateFormat" %>
  
  <% 
  	String id=session.getAttribute("id").toString();
  
  	String pid = request.getParameter("pid"); 
  	String prod_name="";
  	int price;
  	String seller_uid="";
  	String seller_id="";
  	String seller_phone="";
  	String trading="";
	String prod_content="";
  	Date today=new Date();
  	Date duedate;
  	System.out.println(today);
 	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from product_info where pid=?");
	pst.setString(1,pid);
	ResultSet rs = pst.executeQuery();
	try{
		if (rs.next()) {
			prod_name=rs.getString("name");
			price=rs.getInt("price");
			seller_uid=rs.getString("seller_id");
			seller_phone=rs.getString("phone");
			trading=rs.getString("trading_place");
			duedate=rs.getDate("duedate");
			prod_content=rs.getString("content");
					  		
			long daydiff=(Math.abs(new Date().getTime()-duedate.getTime()));
			
			Date daydif=new Date();
			daydif.setTime(daydiff);	

			double days = (daydiff / (1000.0 * 60.0 * 60.0 * 24.0));
			double hours=days%1.0*24;
			double minutes=hours%1.0*60;
			int daysToInt=(int)Math.floor(days);
			int hoursToInt=(int)Math.floor(hours);
			int minutesToInt=(int)Math.ceil(minutes);
			PreparedStatement pst2 = conn.prepareStatement("Select * from user_info where uid=?");
			pst2.setString(1,pid);
			ResultSet rs2 = pst2.executeQuery();
			try{
				if(rs2.next()){
					seller_id=rs2.getString("id");
				}
			}catch(Exception e){
				out.println(e.toString());
			}
			PreparedStatement pst3 = conn.prepareStatement("Select * from img_info where pid=?");
			pst3.setString(1,pid);
			ResultSet rs3 = pst3.executeQuery();
			String prod_img_path="";
			try{
				if(rs3.next()){
					prod_img_path=rs3.getString("path");
				}
			}catch(Exception e){
				out.println(e.toString());
			}
			PreparedStatement pst4 = conn.prepareStatement("Select * from history where pid=? order by hid desc limit 1");
			pst4.setString(1,pid);
			System.out.println(pid);
			ResultSet rs4 = pst4.executeQuery();
			int cur_price;
			try{
				if(rs4.next()){
					cur_price=rs4.getInt("price");
	%>
    <div class="wrapper">
      <div class="prod-outline">
        <div class="product">
          <img class="product-left" src="img/product-img/bicycle.jpeg" alt="bicyle">
          <div class="product-right">
            <div class="prod-header">
              Product Name : <%=prod_name %>
            </div>
            <div class="prod-info">
              <div class="prod-seller">
                Seller : <%=seller_id %> <br>
                Phone Number : <%=seller_phone %>
              </div>
              <div class="remain-time">
                Remaining time : <%=daysToInt %>D <%=hoursToInt%>H <%=minutesToInt%>M
              </div>
              <div class="current-price">
                Current Product Price : $<%=cur_price %>
              </div>
              <div class="prod-date">
                Trading Place : <%=trading %>
              </div>
             <% 
				}
			}catch(Exception e){
				System.out.println(e.toString());
			}
	}
	}catch(Exception e){
		out.println(e);
	}
	%> 
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
                <%
                PreparedStatement pst3 = conn.prepareStatement("Select * from img_info where pid=?");
    			pst3.setString(1,pid);
    			ResultSet rs3 = pst3.executeQuery();
    			String prod_img_path="";
    			while(rs3.next()){
    				prod_img_path=rs3.getString("path");
    				System.out.println(prod_img_path);
                %>
                  <img class="prod-detail-img" src="<%=prod_img_path%>" alt="bicycle"> <br><br>
                  <%
        			}
                	%>
                  <div classs="prod-detail-txt">
                  <%
                  	if(prod_content!=null){
                  %>
                    <p> <%=prod_content %> </p>
                    <%
                                      		
                  	}%>
                   </div>
                </div>
              </li>
              <li class="content-detail" id="con2">
                <div> Seller : <%=seller_id %></div>
                <div> Phone Number : <%=seller_phone %></div>
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

	<script type="text/javascript" src="calDate.js"></script> 
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
