<%@ page import = "java.sql.*" %>
<%
try {
	String id = request.getParameter("id2");
	String password = request.getParameter("password2");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String type = request.getParameter("type");
	// Administrator has different sign up process becuase of security
	// Normal sign up page is for only normal user.
	// Normal user can have 3 position: 1. buyer, 2. seller
	int classification = 0;
	if (type.equals("buyer")) {
		classification = 1;
	}
	else if (type.equals("seller")) {
		classification = 2;
	}
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	// In "user_info" table, users have their unique key
	PreparedStatement pst = conn.prepareStatement("select max(user_number) from user_info");
	ResultSet rs = pst.executeQuery();
	int count = 0;
	if (rs.next()) {
		count = rs.getInt(1) + 1;
	}

	pst = conn.prepareStatement("insert into user_info values (?, ?, ?, ?, ?, ?)");
	pst.setInt(1, count);
	pst.setString(2, id);
	pst.setString(3, password);
	pst.setString(4, name);
	pst.setString(5, email);
	pst.setInt(6, classification);
	// user_info table schema (user_number(PK), id, password, name, email, classification)
	int rr = pst.executeUpdate();
	
	session.setAttribute("user_name", name);
	// TODO: [JW]Differnt page for buyer and seller
	// If user is only a buyer, then go to buyer page
	if (classification == 1) {
		response.sendRedirect("index.jsp");		
	}
	// If user is a seller, then go to seller page
	else {
		response.sendRedirect("index.jsp");
	}
} catch(Exception e) {
	out.println("Something went wrong !! Please try again");
}
%>