<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>SKKU Flea Market | Member List</title>

	<link rel="stylesheet" href="css/core-style.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" type="text/css" href="css/member_list-style.css">
</head>
<body>
<%
// Extra Function Implementation | Authority check for security
if (session.getAttribute("classification") == null) {
	response.sendRedirect("authority-error-message.jsp");
}
else {
	int c = (int)session.getAttribute("classification");
	if (c != 0) {
		response.sendRedirect("authority-error-message.jsp");
	}
}

int cur_page = 0;
if (request.getParameter("cur_page") != null) {
	cur_page = Integer.parseInt(request.getParameter("cur_page"));
}
int total_count = 0;
int total_page = 0;
int paging_limit = 2;
int cur_count = 0;
%>
<input type="hidden" id="cur_page" value=<%=cur_page %>>
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
						<span class="hello-admin">Hello, Administrator</span>
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
						// Find the total page number for pagination
						PreparedStatement pst = conn.prepareStatement("Select count(*) from user_info");
						ResultSet rs = pst.executeQuery();
						if (rs.next()) {
							total_count = rs.getInt(1);
							total_page = (int)Math.ceil((double)rs.getInt(1)/2);
						}
				%>

			<div class="list-wrapper">
				<!-- TOP BAR & ITEM LIST -->
		        <div class="top-list-page">
		            <!-- TOP BAR -->
				<div class="list-topbar">
					<!-- Total Products -->
					<div class="showing">
						<p>SHOWING <%=cur_page * paging_limit + 1 %>-<%=(cur_page + 1) * paging_limit %> 0f <%=total_count %> </p>
					</div>
					<!-- Sorting -->
					<div class="product-sorting">
						<select>
							<option value="value">Sort by</option>
							<option value="value">Name</option>
							<option value="value">ID</option>
							<option value="value">Recent</option>
							<option value="value">None</option>
						</select>
					</div>
				</div>

				<!-- MEMBER LIST -->
		            <div class="member-list" id="member-list-table">
		            	<table border="0">
		            		<th>ID</th>
		            		<th>Password</th>
		            		<th>Name</th>
		            		<th>Email</th>
		            		<th>Classification</th>
		            		<th>Modify</th>
		            		<th>Delete</th>
		            		<%
		            			// Select all user's information from user_info table
		            			// user_info table schema (user_number(PK), id, password, name, email, classification)
								pst = conn.prepareStatement("Select * from user_info");
								rs = pst.executeQuery();
								String id = "";
								String password = "";
								String name = "";
								String email = "";
								int classification = 0;
								String cl = "";
								// This loop is for paging
								while (rs.next()) {
									// If cur_count is less than paging_limit * cur_page, then don't show it
									if (cur_count < paging_limit * cur_page) {
										cur_count += 1;
										continue;
									}
									// If cur_count is greater and equal than paging_limit * (cur_page + 1), then get out from this loop
									if (cur_count >= paging_limit * (cur_page + 1)) {
										break;
									}
									id = rs.getString("id");
									password = rs.getString("password");
									name = rs.getString("name");
									email = rs.getString("email");
									classification = rs.getInt("classification");
									if (classification == 0) {
										cl = "Administrator";
									}
									else if (classification == 1) {
										cl = "Buyer";
									}
									else {
										cl = "Seller";
									}
									// Put the corresponding values to html table
							%>
							<tr>
		            			<td><%=id %></td>
		            			<td><%=password %></td>
		            			<td><%=name %></td>
		            			<td><%=email %></td>
		            			<td><%=cl %></td>
		            			<!-- Extra Function Implementation | User Modification with least effort -->
		            			<td><a href="member-modification.jsp?user=<%=id %>" class="btn amado-btn w-100">MODIFY</a></td>
		            			<td><a href="member-delete-function.jsp?user=<%=id %>" class="btn amado-btn w-100">DELETE</a></td>
		            		</tr>
							<%
									cur_count += 1;
									}
								} catch(Exception e) {
									out.println("Something went wrong !! Please try again");
								}
							%>
		            	</table>
		            </div>

		            <!-- Extra Function Implementation | Pagination -->
		            <div class="pagination">
		                <button class="previous"><img src="img/core-img/arrow-pointing-to-left.png" onclick="sendDecVal()"></button>
		                <p><%=cur_page+1 %> / <%=total_page %></p>
		                <button class="next"><img src="img/core-img/arrow-pointing-to-right.png" onclick="sendIncVal()"></button>
		            </div>
		        </div>
				</div>
		</div>

	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="js/member-list.js"></script>
</body>
</html>
