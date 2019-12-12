<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | User Info Modification</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/header-style.css">
    <link rel="stylesheet" href="css/mypage.css">
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
    	.checkout_details_area form .form-control,
    	.checkout_details_area form .nice-select {
    		background-color: white;
    	}
    	
    	.main-content-wrapper .cart-table-area .cart-summary {
    		background-color: inherit;
    	}
    
    	#logout-btn {
			margin-top: 80%;
			background-color: black;
			color: white;
			font-size: 0.9em;
		}
		
		.hello-admin {
			transition: all 0.5s
		}
		
		.hello-admin:hover {
			color: rgba(255, 0, 76, 1);
		}
		
		.header-area {
			height: 100%;
		}
    </style>

</head>

<body>
	<%
String user = "";
if (session.getAttribute("id") != null) {
	user = (String)session.getAttribute("id");
}
int uid = 0;
String id = "";
String password = "";
String name = "";
String email = "";
int classification = 0;
%>
<%@ page import="java.sql.*"%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	// Find the information corresponding to id which acquire from member-list.jsp file
	PreparedStatement pst = conn.prepareStatement("select * from user_info where id=?");
	pst.setString(1, user);
	ResultSet rs = pst.executeQuery();
	if (rs.next()) {
		uid = rs.getInt("uid");
		id = rs.getString("id");
		password = rs.getString("password");
		name = rs.getString("name");
		email = rs.getString("email");
		classification = rs.getInt("classification");
	}
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
%>
<% 
	if (classification == 1) { 
%>
	<%@include file="header-buyer.jsp" %>
<%	}
	else {
%>
	<%@include file="header-seller.jsp" %>
<%
	}
%>
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
			<input type="hidden" id="classification" value=<%=classification%>>
			<input type="hidden" id="uid" value=<%=uid %>>

		<div class="area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area clearfix">
                            <div class="cart-title">
                                <h2>Member Modification</h2>
                            </div>
            				<form action="#" method="post">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <input type="hidden" class="form-control" id="id" value=<%=id %> readonly>
                                        <input type="text" class="form-control" id="fake-id" placeholder="ID: <%=id %>" readonly>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" class="form-control" id="pass" value=<%=password %> placeholder="Password: <%=password %>" required>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <input type="text" class="form-control" id="name" value=<%=name %> placeholder="Name: <%=name %>" required>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" value=<%=email %> placeholder="Email: <%=email %>" value="">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <select class="w-100" id="buyer-seller">
                                        <option value="0">Administrator</option>
                                        <option value="1">Buyer</option>
                                        <option value="2">Seller</option>
                                    </select>
                                    </div>
                                </div>
                        	</form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <div class="cart-btn mt-15">
                            	<!-- Extra Function Implementation | Input validation on member modification -->
                                <a href="javascript:goToSave()" class="btn amado-btn w-100">Save</a>
                            </div>
                            <div class="cart-btn mt-50">
                                <a href="javascript:reload()" class="btn amado-btn w-100">Reset</a>
                            </div>
                            <div class="cart-btn mt-50">
                                <a href="mypage.jsp" class="btn amado-btn w-100">Cancel</a>
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
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <script src="js/member-list.js"></script>
    <script>setDefOpt();</script>
</body>

</html>
