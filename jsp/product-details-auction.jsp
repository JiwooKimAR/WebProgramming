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
  <%@ include file="header-buyer.jsp"%>
  <%@ page import="java.sql.*"%>
  <%@ page import="java.util.Date" %>
  <%@ page import="java.text.SimpleDateFormat" %>
  
  <% 
  	String id=session.getAttribute("id").toString();
  	String pid = request.getParameter("pid"); 
  	String prod_name="";
  	int price;
  	int seller_uid=0;
  	String seller_id="";
  	String seller_phone="";
  	String trading="";
	String prod_content="";
  	Date today=new Date();
  	Date duedate;
  	double bid_unit=0;
  	int cur_price=0;
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
			seller_uid=rs.getInt("seller_id");
			seller_phone=rs.getString("phone");
			trading=rs.getString("trading_place");
			duedate=rs.getDate("duedate");
			prod_content=rs.getString("content");
			bid_unit=rs.getDouble("unit");		  		
			long daydiff=(Math.abs(new Date().getTime()-duedate.getTime()));
			System.out.println(daydiff);
			Date daydif=new Date();
			daydif.setTime(daydiff);	
			
			double days = (daydiff / (1000.0 * 60.0 * 60.0 * 24.0));
			double hours=days%1.0*24;
			double minutes=hours%1.0*60;
			int daysToInt=(int)Math.floor(days);
			int hoursToInt=(int)Math.floor(hours);
			int minutesToInt=(int)Math.ceil(minutes);
			PreparedStatement pst2 = conn.prepareStatement("Select * from user_info where uid=?");
			pst2.setInt(1,seller_uid);
			ResultSet rs2 = pst2.executeQuery();
			try{
				if(rs2.next()){
					seller_id=rs2.getString("id");
				  	System.out.println(seller_id);
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
				System.out.println(e.toString());
			}
			PreparedStatement pst4 = conn.prepareStatement("Select * from history where pid=? order by hid desc limit 1");
			pst4.setString(1,pid);
			System.out.println(pid);
			ResultSet rs4 = pst4.executeQuery();
			try{
				if(rs4.next()){
					cur_price=rs4.getInt("price");
					check=1;
				}else{
					cur_price=price;
				}
	%>
    <div class="wrapper">
      <div class="prod-outline">
        <div class="product">
          <img class="product-left" src="<%=prod_img_path%>" alt="bicyle">
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
              <%if(check==1){out.println("This product is sold out");}
              
			}catch(Exception e){
				System.out.println(e.toString());
			}
	}
	}catch(Exception e){
		out.println(e);
	}
	%> 
            </div>
            <div class="prod-btn-lst"<%if(check==1) {%>style="display:none;"<%} %>>
              <button class="prod-wish-list-btn" title="Add to Wish list" onclick="location.href='addwish.jsp?pid=<%=pid%>'" >
              </button>
              <form class="prod-bid-lst" action="bid.jsp" method="post">
                <div><input type="text" name="bidprice" value="" placeholder="Type your Bid price"></div>              
                <input type="hidden" name="pid" value="<%=pid%>">
                <input type="hidden" name="cur_price" value="<%=cur_price%>">
                <div><button class="bid"type="submit" name="button">BID!</button></div>
                <div>Bid Unit : $<%=bid_unit%></div>
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
                   <%=prod_content %> 
                   
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

 	<%@ include file="footer-buyer.jsp"%>

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
