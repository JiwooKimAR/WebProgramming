<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@include file="header-seller.jsp" %>
<%
	//Session value checking for security
	String id = "";
	if (session.getAttribute("id") == null) {
		response.sendRedirect("authority-error-message.jsp");
	}
	else {
		id=session.getAttribute("id").toString();
	}
	String user_name = "";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
	pst.setString(1,id);
	ResultSet rs = pst.executeQuery();
	try{
		if (rs.next()) {
			user_name = rs.getString("name");
		}
		PreparedStatement pst3 = conn.prepareStatement("Select * from wish_cart_info where buyer_id=?");
		pst3.setString(1,id);
		ResultSet rs3 = pst3.executeQuery();
		if (rs3.next()) {
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
          
            </div>
          </div>
          </div>

	<%@ include file="footer-seller.jsp" %>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/active.js"></script>

</body>
  </html>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
