<%@ page import="java.sql.*"%>
<%

	//Session value checking for security
	String id = session.getAttribute("id").toString();
	String pid = request.getParameter("pid"); 
	int uid=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from history where pid=? order by hid desc");
	int pid_= Integer.parseInt(pid);
	pst.setInt(1,pid_);
	ResultSet rs = pst.executeQuery();

	int buyer_id=0;
	double price=0;
	try{
		if (rs.next()) {
			buyer_id=rs.getInt("buyer_id");
		}
		PreparedStatement pst2 = conn.prepareStatement("update product_info set buyer_id=? WHERE pid=?");
		pst2.setInt(1,buyer_id);
		pst2.setInt(2,pid_);
		int rs2 = pst2.executeUpdate();
			%>
			<script>
				alert("The auction is closed.")
				history.go(-1); </script>
			<%
	}catch(Exception e){
		out.println(e.toString());
	}
%>