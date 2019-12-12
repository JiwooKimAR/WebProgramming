<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@include file="header-buyer.jsp" %>
<%
	//Session value checking for security
	String id = "";
	if (session.getAttribute("id") == null) {
		response.sendRedirect("authority-error-message.jsp");
	}
	else {
		id=session.getAttribute("id").toString();
	}
	int classification;
	String user_name = "";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
	pst.setString(1,id);
	ResultSet rs = pst.executeQuery();
	try{
		if (rs.next()) {
			classification = rs.getInt("classification");
			user_name = rs.getString("name");
			// classification: 0(admin) / 1(normal user)
		}
		PreparedStatement pst3 = conn.prepareStatement("Select * from wish_cart_info where buyer_id=?");
		pst3.setString(1,id);
		ResultSet rs3 = pst3.executeQuery();
		if (rs3.next()) {
			classification = rs3.getInt("classification");
			user_name = rs3.getString("name");
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
            <button class="chng-usr-info" type="button" name="button" onclick="location.href='user-info-modification.jsp'">Change User Info</button>
            </div>
          </div>
          <div class="prod-bid pad outer">
          	<div class="title-outer">
          	 <p class="user-info-title">Bid List</p>
             <button class="more_btn" type="button" name="button">More</button>
          	</div>
            <div class="prod-bid-lst inner">
              <%
              try{
      			  int uid=rs.getInt("uid");
            	  PreparedStatement pst2 = conn.prepareStatement("Select * from history where buyer_id=?");
            	  pst2.setInt(1,uid);
  	          	  ResultSet rs2 = pst2.executeQuery();
  	          	  int i=0;
  	          	  System.out.print("BID");
  	          	  while(rs2.next()) {
  	          		System.out.print(i);
  	          		if(i==3){
  	          		 System.out.print("BREAK");
  	          			break;
  	          		}
  	          		i++;
            		int pid_ = rs2.getInt("pid");
            		PreparedStatement pst2_prod = conn.prepareStatement("Select * from product_info where pid=?");
            		PreparedStatement pst2_prod_path = conn.prepareStatement("Select * from img_info where pid=?");
            		pst2_prod.setInt(1,pid_);
            		pst2_prod_path.setInt(1,pid_);
            		ResultSet rs2_prod = pst2_prod.executeQuery();
            		ResultSet rs2_prod_path = pst2_prod_path.executeQuery();
            		String prod_name="";
            		String prod_path="";
            		if (rs2_prod.next()&&rs2_prod_path.next()) {
            			prod_name=rs2_prod.getString("name");
            			prod_path=rs2_prod_path.getString("path");
            			System.out.print(prod_name+prod_path);
            		}

           		%>
					<img src="<%=prod_path%>" alt="<%=prod_name%>" onclick="location.href='product-details.jsp?pid=<%=pid_%>'">
            	<%
           	      }
  	          	  if(i==0){ %>
           	      The Bid List is Empty
           	    <%
           	      }
              }catch(Exception e){
            	  out.println(e.toString());
              }
            %>
            </div>
          </div>
          <div class="prod-wish pad outer">
            <div class="title-outer">
          	 <p class="user-info-title">Cart List</p>
             <button class="more_btn" type="button" name="button"  onclick="location.href='cart_list.jsp'">More</button>
          	</div>
            <div class="uploaded-prod-lst inner">
            <%
            try{
            	int uid=rs.getInt("uid");
          	  	PreparedStatement pst2 = conn.prepareStatement("Select * from wish_cart_info where buyer_id=? and status=1");
          	  	pst2.setInt(1,uid);
	          	ResultSet rs2 = pst2.executeQuery();
          	    int i=0;
          	    System.out.print("WISH");
          	    while(rs2.next()) {
	          	 	System.out.print(i);
	          		if(i==3){
	          		 System.out.print("BREAK");
	          			break;
	          		}
	          		i++;
	          		int pid_ = rs2.getInt("prod_id");
	          		PreparedStatement pst2_prod = conn.prepareStatement("Select * from product_info where pid=?");
	          		PreparedStatement pst2_prod_path = conn.prepareStatement("Select * from img_info where pid=?");
	          		pst2_prod.setInt(1,pid_);
	          		pst2_prod_path.setInt(1,pid_);
	          		ResultSet rs2_prod = pst2_prod.executeQuery();
	          		ResultSet rs2_prod_path = pst2_prod_path.executeQuery();
	          		String prod_name="";
	          		String prod_path="";
	          		if (rs2_prod.next()&&rs2_prod_path.next()) {
	          			prod_name=rs2_prod.getString("name");
	          			prod_path=rs2_prod_path.getString("path");
	          			System.out.print(prod_name+prod_path);
	          		}

         		%>
					<img src="<%=prod_path%>" alt="<%=prod_name%>">
          	<%
         	      }
	          	  if(i==0){ %>
         	      The Cart List is Empty
         	    <%
         	      }
            }catch(Exception e){
          	  out.println(e.toString());
            }
            %>
            </div>
          </div>
          <div class="prod-wish pad outer">
           <div class="title-outer">
          	 <p class="user-info-title">Wish List</p>
             <button class="more_btn" type="button" name="button"  onclick="location.href='wish_list.jsp'">More</button>
          	</div>
            <div class="uploaded-prod-lst inner">
			<%
            try{
            	int uid=rs.getInt("uid");
          	  	PreparedStatement pst2 = conn.prepareStatement("Select * from wish_cart_info where buyer_id=? and status=0");
          	  	pst2.setInt(1,uid);
	          	ResultSet rs2 = pst2.executeQuery();
          	    int i=0;
          	    System.out.print("WISH");
          	    while(rs2.next()) {
	          	 	System.out.print(i);
	          		if(i==3){
	          		 System.out.print("BREAK");
	          			break;
	          		}
	          		i++;
	          		int pid_ = rs2.getInt("prod_id");
	          		PreparedStatement pst2_prod = conn.prepareStatement("Select * from product_info where pid=?");
	          		PreparedStatement pst2_prod_path = conn.prepareStatement("Select * from img_info where pid=?");
	          		pst2_prod.setInt(1,pid_);
	          		pst2_prod_path.setInt(1,pid_);
	          		ResultSet rs2_prod = pst2_prod.executeQuery();
	          		ResultSet rs2_prod_path = pst2_prod_path.executeQuery();
	          		String prod_name="";
	          		String prod_path="";
	          		if (rs2_prod.next()&&rs2_prod_path.next()) {
	          			prod_name=rs2_prod.getString("name");
	          			prod_path=rs2_prod_path.getString("path");
	          			System.out.print(prod_name+prod_path);
	          		}

         		%>
					<img src="<%=prod_path%>" alt="<%=prod_name%>">
          	<%
         	      }
	          	  if(i==0){ %>
         	      The Wish List is Empty
         	    <%
         	      }
            }catch(Exception e){
          	  out.println(e.toString());
            }
            %>
            </div>
          </div>
        </div>
      </div>
    </div>
      
	<%@ include file="footer-buyer.jsp" %>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/active.js"></script>

</body>
  </html>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
