<script>function addcart(){
alert("Press Add Cart Button");
}</script>

<%@ page import="java.sql.*"%>
<%
	//Session value checking for security
System.out.println("????");
	String id = session.getAttribute("id").toString();
	String pid = request.getParameter("pid"); 
	int uid=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
	pst.setString(1,id);
	ResultSet rs = pst.executeQuery();
	try{
		if (rs.next()) {
			uid=rs.getInt("uid");
		}
		PreparedStatement pst3 = conn.prepareStatement("Insert into wish_cart_info values (?,?,1,1)");
		System.out.println(uid+" "+pid);
		pst3.setInt(1,uid);
		int pid_= Integer.parseInt(pid);
		pst3.setInt(2,pid_);
		pst3.executeUpdate();
%> 
<script>
	alert("This Product is added to your cart.")
	history.go(-1); </script>
<%
	}catch(Exception e){
		out.println(e.toString());
	}
%>