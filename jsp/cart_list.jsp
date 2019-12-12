<!DOCTYPE html>
<html>
<%@ page import="java.sql.*"%>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>SKKU Flea Market | Cart List</title>

  <!-- Favicon  -->
  <link rel="icon" href="img/core-img/favicon.ico">

  <link rel="stylesheet" href="css/core-style.css">
  <link rel="stylesheet" href="css/header-style.css">
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/cart_list-style.css">
</head>
<body>
	<%@ include file="header-buyer.jsp" %>
	<% 
	int id_=0;
	String prod_name="";
	String prod_img_path="";
	double price=0;
	int qnt=0;
	int status=0;
	int amount=0;

	int prod_id=0;
	String status_="";
	
  	String id=session.getAttribute("id").toString();
  	try{
  	Class.forName("com.mysql.jdbc.Driver");	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst_id = conn.prepareStatement("Select * from user_info where id=?");
	pst_id.setString(1,id);
	ResultSet rs_id = pst_id.executeQuery();
	if(rs_id.next()){
		id_=rs_id.getInt("uid");
	}
	PreparedStatement pst = conn.prepareStatement("Select * from wish_cart_info where buyer_id=? and status=1");
	pst.setInt(1,id_);
	ResultSet rs = pst.executeQuery();
		
	%>

        <div class="cart-list-table-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th class="check-table">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="all-check">
                                                <label class="form-check-label" for="all"></label>
                                            </div>
                                        </th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <% 
                                while(rs.next()){
			prod_id=rs.getInt("prod_id");
			PreparedStatement pst2 = conn.prepareStatement("Select * from product_info where pid=?");
			pst2.setInt(1,prod_id);
			System.out.println(prod_id);
			ResultSet rs2 = pst2.executeQuery();			
			if(rs2.next()){
				prod_name=rs2.getString("name");
				price=rs2.getDouble("price");
				status=rs2.getInt("status");
				amount=rs2.getInt("amount");
				if(status==0){
					status_="auction";
				}else if(status==1){
					status_="Sold Out";
				}else{
					status_="Selling";
				}
			}
			PreparedStatement pst3 = conn.prepareStatement("Select * from img_info where pid=?");
			pst3.setInt(1,prod_id);
			ResultSet rs3 = pst3.executeQuery();
			if(rs3.next()){
				prod_img_path=rs3.getString("path");
			}	%>
                     <tbody>
                                    <tr>
                                        <td class="check-table">
                                            <div class="form-check">
                                                <input class="form-check-input" name="check" type="checkbox" value="<%=price %>" id="check">
                                                <label class="form-check-label" for="all"></label>
                                            </div>
                                        </td>
                                        <td class="cart_product_img">
                                            <a href='product-details.jsp?pid=<%=prod_id%>'"><img src="<%=prod_img_path%>" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5><%=prod_name %></h5>
                                        </td>
                                        <td class="price">
                                            <span>$<%=price %></span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <div class="quantity">
                                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="<%=amount %>" name="quantity" value="1">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="status">
                                            <span><%=status_ %></span>
                                        </td>
                                    </tr>
                                                                    
                                <%
                                }
                                PreparedStatement pst1 = conn.prepareStatement("Select * from product_info where buyer_id=? and status=0");
                               	pst1.setInt(1,id_);
                                ResultSet rs1 = pst1.executeQuery();
                                
                                while(rs1.next()){
                                	String name=rs1.getString("name");
                                	prod_id=rs1.getInt("pid");
                                	PreparedStatement pst2 = conn.prepareStatement("Select * from history where buyer_id=? and pid=?");
                                   	pst2.setInt(1,id_);
                                   	pst2.setInt(2,prod_id);
                                    ResultSet rs2 = pst2.executeQuery();
                                    double cur_price=0.0;
                                	if(rs2.next()){
                                		cur_price=rs2.getDouble("price");
                                	}
                                	PreparedStatement pst3 = conn.prepareStatement("Select * from img_info where pid=?");
                                   	pst3.setInt(1,prod_id);
                                    ResultSet rs3 = pst3.executeQuery();
                                    String img_path="";
                                    if(rs3.next()){
                                    	img_path=rs3.getString("path");
                                    }
                                   %>
                                   <tr>
                                        <td class="check-table">
                                            <div class="form-check">
                                                <input class="form-check-input" name="check" type="checkbox" value="<%=cur_price %>" id="check" checked disabled>
                                                <label class="form-check-label" for="all"></label>
                                            </div>
                                        </td>
                                        <td class="cart_product_img">
                                            <a href='product-details.jsp?pid=<%=prod_id%>'"><img src="<%=prod_img_path%>" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5><%=prod_name %></h5>
                                        </td>
                                        <td class="price">
                                            <span>$<%=cur_price %></span>
                                        </td>
                                        <td class="qty">
                                            <div class="qty-btn d-flex">
                                                <div class="quantity">
                                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="<%=amount %>" name="quantity" value="1">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="status">
                                            <span>Successful Bid</span>
                                        </td>
                                    </tr>
                                   
                                   <%
                                    
                                		
                                }
	}catch(Exception e){
		System.out.println(e.toString());
	}
	
	
	%>
    
          
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>total:</span> <span id="total"></span></li>
                            </ul>
                            <div class="cart-btn">
                                <button class="btn amado-btn w-100" onclick="changeRadioValues()">Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
	<script src="js/checkout.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>


</body>
</html>
