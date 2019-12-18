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
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="css/product-details-style.css">
  </head>
  <body>
  <%@ include file="header-seller.jsp" %>
  <%@ page import="java.sql.*"%>
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
  	int amount;
  	int status;
  	String status_="";
 	int check=0;
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
			System.out.println("seller_uid");
			seller_phone=rs.getString("phone");
			trading=rs.getString("trading_place");
			amount=rs.getInt("amount");
			prod_content=rs.getString("content");
			status=rs.getInt("status");
			if(status==0){
				status_="Auction";
			}else if(status==1){
				status_="Sold Out";
			}else{
				status_="Selling";
			}
			PreparedStatement pst2 = conn.prepareStatement("Select * from user_info where uid=?");
			pst2.setString(1,seller_uid);
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
	%>
    <div class="wrapper">
      <div class="prod-outline">
        <div class="product">
          <img class="product-left" src="<%=prod_img_path %>" alt="bicyle">
          <div class="product-right">
            <div class="prod-header">
              Product Name : <%=prod_name %>
            </div>
            <div class="prod-info">
              <div class="prod-price">
                Price : $<%=price %>
              </div>
              <div class="prod-seller">
              	<div> Seller : <%=seller_id %></div>
                <div> Phone Number : <%=seller_phone %></div>
               
              </div>
              <div class="trdng-plc">
                Trading Place : <%=trading %>
              </div>
              <div class="amnt">
              	Amount : <%=amount %>
              </div>
            </div>
            <div>
	           	<div>
	           	 <%=status_ %>
	           	</div>
            </div>
            <%if(check==1){out.println("This product is sold out");}
              	
              	%>
            <%
				
           }
		}catch(Exception e){
			out.println(e.toString());
	}
	%>
              <button class="editproduct" onclick="location.href='product_edit.jsp?pid=<%=pid%>'">Edit Product</button>
          </div>
        </div>
        <div class="prod-detail">
          <div class="tab">
            <ul class="tab-title">
              <li name="detail"class="active" data-tab="con1">Product Detail</li>
              <li name="auction" data-tab="con2">Seller Information</li>
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
                  	<%=prod_content %>
                </div>
              </li>
              <li class="content-detail" id="con2">
                Seller ID : <%=seller_id %> <br>
                Phone Number : <%= seller_phone %>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>

  <%@ include file="footer-seller.jsp" %>

	<script src="js/addcart.js"></script>
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
