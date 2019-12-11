<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<!-- Title  -->
	<title>ID Duplication Test</title>
	
	<!-- Core Style CSS -->
	<style type="text/css">
		body {
			background: rgba(251, 183, 16, .8);
		}
		
		div {
			background: white;
			text-align: center;
			border: 5px solid rgba(141, 198, 63, 1);
			border-radius: 20px;
		}
		
		.id {
			color: red;
			font-weight: bold;
			font-size: 20px;
		}
		
		.underline {
			text-decoration: underline;
		}
	</style>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	try {
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
		PreparedStatement pst = conn.prepareStatement("Select id from user_info where id=?");
		pst.setString(1, id);
		// user_info table schema (user_number(PK), id, password, name, email, classification)
		ResultSet rs = pst.executeQuery();
		// If there's same id, then return error message
		if (rs.next()) {%>
		<input type="hidden" id="status1" value="1">
		<input type="hidden" id="status2" value="0">
	<div>
		<p>
			<span class="id"><%=id %></span> already exists. Please enter another ID.<br>
			Please <span class="underline">exit</span> this window and try duplication test again with new ID.
		</p>
	</div>
	<%
		}
		// It there's no same id, then return normal message
		else {%>
		<input type="hidden" id="status2" value="1">
		<input type="hidden" id="status1" value="0">
	<div>
		<p>
			<span class="id"><%=id %></span> has no duplication. You can use it.<br>
			Please <span class="underline">exit</span> this window and fill other forms.
		</p>
	</div>
	<%
		}
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
	%>
	<script src="../js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="../js/login.js"></script>
    <script type="text/javascript">dtestPass();</script>
	</body>
</html>