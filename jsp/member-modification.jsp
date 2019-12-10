<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | Member Modification</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
    	.bottom-space {
    		margin-bottom: 100px;
    	}
    	
    	#logout-btn {
			margin-top: 80%;
			background-color: black;
			color: white;
		}
    </style>

</head>

<body>
<%
String user = "";
if (request.getParameter("user") != null) {
	user = request.getParameter("user");
}
int uid = 0;
String id = "";
String password = "";
String name = "";
String email = "";
int classification = 0;
%>
    <!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">

			<!-- Mobile Nav (max width 767px)-->
			<div class="mobile-nav">
					<!-- Navbar Brand -->
					<div class="amado-navbar-brand">
							<a href="member_list.jsp"><img src="img/core-img/logo.png" alt=""></a>
					</div>
					<!-- Navbar Toggler -->
					<div class="amado-navbar-toggler">
							<span></span><span></span><span></span>
					</div>
			</div>

			<!-- Header Area Start -->
			<header class="header-area clearfix">
					<!-- Close Icon -->
					<div class="nav-close">
							<i class="fa fa-close" aria-hidden="true"></i>
					</div>
					<!-- Logo -->
					<div class="logo">
							<a href="member_list.jsp"><img src="img/core-img/logo.png" alt=""></a>
					</div>
					<!-- Amado Nav -->
					<nav class="amado-nav">
						Hello, Administrator
							<ul>
									<li><a href="member_list.jsp">Member List</a></li>
							</ul>
						<a href="logout-function.jsp" class="btn amado-btn w-100" id="logout-btn">Logout</a>
					</nav>
			</header>
			<!-- Header Area End -->
			
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
			<input type="hidden" id="classification" value=<%=classification%>>
			<input type="hidden" id="uid" value=<%=uid %>>

		<div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">
                            <div class="cart-title">
                                <h2>Member Modification</h2>
                            </div>
            				<form action="#" method="post">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <input type="text" class="form-control" id="id" value=<%=id %> placeholder="ID: <%=id %>" required>
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
                                        <option>Administrator</option>
                                        <option>Buyer</option>
                                        <option>Seller</option>
                                    </select>
                                    </div>
                                </div>
                        	</form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <div class="cart-btn mt-15">
                                <a href="javascript:goToSave()" class="btn amado-btn w-100">Save</a>
                            </div>
                            <div class="cart-btn mt-50">
                                <a href="javascript:reload()" class="btn amado-btn w-100">Reset</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    
    <div class="bottom-space"></div>

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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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
                                            <a class="nav-link" href="index.html">Member</a>
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
