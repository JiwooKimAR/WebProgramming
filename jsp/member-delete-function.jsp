<%@ page import="java.sql.*"%>
<%
	try {
		String user = request.getParameter("user");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
		// Delete the information corresponding to id which acquire from member-list.jsp file
		PreparedStatement pst = conn.prepareStatement("delete from user_info where id=?");
		pst.setString(1, user);
		// user_info table schema (user_number(PK), id, password, name, email, classification)
		int rr = pst.executeUpdate();
		// Alwayrs rr value is 1
		
		response.sendRedirect("member_list.jsp");
	} catch (Exception e) {
		out.println("Something went wrong !! Please try again");
	}
%>