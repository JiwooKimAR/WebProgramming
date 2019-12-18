<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | 7 Days Left</title>

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
String id = (String)session.getAttribute("id");

ArrayList<Integer> aPid = new ArrayList<Integer>();

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("select pid from product_info where status=0 and date(duedate) <= date(adddate(now(), INTERVAL 7 DAY))");
	// Find the auction product that's duedate is up to finish
	// The auction product that is finished within 7 days
	ResultSet rs = pst.executeQuery();
	while (rs.next()) {
		aPid.add(rs.getInt(1));
	}
%>

<body>
    <%@ include file="header-buyer.jsp" %>

        <!-- 7 Days Left in Auciton -->
        <div class="area">
        	<div class="index-title">7 Days Left</div>
            <div class="amado-pro-catagory clearfix">
                <!-- Single Catagory -->
                <%
            	for (int i = 0; i < aPid.size(); i++) {
            		String name = "";
            		double price = 0.0;
            		String date = "";
            		String path = "";
            		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            		pst = conn.prepareStatement("select name, price, duedate from product_info where pid=?");
            		pst.setInt(1, aPid.get(i));
            		// Get the name, price, status information from popular product items
            		rs = pst.executeQuery();
            		if (rs.next()) {
            			name = rs.getString("name");
            			price = rs.getDouble("price");
            			date = dateformat.format(rs.getDate("duedate"));
            		}
            		pst = conn.prepareStatement("select * from img_info where pid=?");
            		pst.setInt(1, aPid.get(i));
            		rs = pst.executeQuery();
            		if (rs.next()) {
            			path = rs.getString("path");
            		}
            %>
                <div class="single-products-catagory clearfix">
                    <a href="product-details-auction.jsp?pid=<%=aPid.get(i) %>">
                        <img src="<%=path %>" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From $<%=price %></p>
                            <p>Due date <%=date %></p>
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
