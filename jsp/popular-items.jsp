<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/index-style.css">
</head>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
if (session.getAttribute("classification") == null) {
	response.sendRedirect("authority-error-message.jsp");
}
else {
	int c = (int)session.getAttribute("classification");
	if (c != 1) {
		response.sendRedirect("authority-error-message.jsp");
	}
}

String id = (String)session.getAttribute("id");

ArrayList<Integer> pPid = new ArrayList<Integer>();

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("select count(*), prod_id from wish_cart_info group by prod_id order by count(*) desc");
	// Find the popular product
	// The product that is on the cart list most
	ResultSet rs = pst.executeQuery();
	while (rs.next()) {
		pPid.add(rs.getInt(2));
	}

%>

<body>
    <%@ include file="header-buyer.jsp" %>

        <!-- Popular Items -->
        <div class="area">
        	<div class="index-title">Popular Items</div>
            <div class="amado-pro-catagory clearfix">
            <!-- Single Catagory -->
            <%
            	for (int i = 0; i < pPid.size(); i++) {
            		String name = "";
            		double price = 0.0;
            		int status = 0;
            		String path = "";
            		pst = conn.prepareStatement("select name, price, status from product_info where pid=?");
            		pst.setInt(1, pPid.get(i));
            		// Get the name, price, status information from popular product items
            		rs = pst.executeQuery();
            		if (rs.next()) {
            			name = rs.getString("name");
            			price = rs.getDouble("price");
            			status = rs.getInt("status");
            		}
            		pst = conn.prepareStatement("select * from img_info where pid=?");
            		pst.setInt(1, pPid.get(i));
            		rs = pst.executeQuery();
            		if (rs.next()) {
            			path = rs.getString("path");
            		}
            %>
                <div class="single-products-catagory clearfix">
                    <a href="product-details<%if(status==0) {%>-auction<%} %>.jsp?pid=<%=pPid.get(i) %>">
                        <img src="<%=path %>" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $<%=price %></p>
                            <h4><%=name %></h4>
                        </div>
                    </a>
                </div>
            <%
            	}
            %>
            </div>
        </div>
<%
}
catch(Exception e) {
	System.out.println("Exception occur in index.jsp");
}
%>
    
	</div>
	<%@ include file="footer-buyer.jsp" %>

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

</body>

</html>
