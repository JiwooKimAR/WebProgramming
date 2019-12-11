<%@ page import="java.sql.*"%>
<%
	int c = 0;
	if (session.getAttribute("classification") == null) {
		session.invalidate();
		response.sendRedirect("authority-error-message.jsp");
	}
	else {
		c = (int)session.getAttribute("classification");
	}
	try {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int classification = Integer.parseInt(request.getParameter("classification"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
		PreparedStatement pst = conn.prepareStatement("update user_info set id=?, password=?, name=?, email=?, classification=? where uid=?");
		pst.setString(1, id);
		pst.setString(2, password);
		pst.setString(3, name);
		pst.setString(4, email);
		pst.setInt(5, classification);
		pst.setInt(6, uid);
		// user_info table schema (user_number(PK), id, password, name, email, classification)
		int rr = pst.executeUpdate();
		// Alwayrs rr value is 1
		if (c == 0) {
			response.sendRedirect("member_list.jsp");
		}
		else {
			// Change the session information
			session.setAttribute("id", id);
			session.setAttribute("classification", classification);
			response.sendRedirect("mypage.jsp");
		}
	} catch(Exception e) {
		out.println("Something went wrong !! Please try again");
	}
%>
		