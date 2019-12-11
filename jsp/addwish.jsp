<%@ page import="java.sql.*"%>
<%
	String id = session.getAttribute("id").toString();
	String pid = request.getParameter("pid"); 
	int uid=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
	pst.setString(1,id);
	ResultSet rs = pst.executeQuery();
	int pid_= Integer.parseInt(pid);
	try{
		if (rs.next()) {
			uid=rs.getInt("uid");
		}
		PreparedStatement pst2 = conn.prepareStatement("Select * from wish_cart_info where buyer_id=? and prod_id=? and status=0");
		System.out.println(uid+" "+pid);
		pst2.setInt(1,uid);
		pst2.setInt(2,pid_);
		ResultSet rs2 = pst2.executeQuery();
		if(rs2.next()){
	%>
<script>
	alert("This Product is already existed in your wish list.")
	history.go(-1); 
</script>
	<%
		}else{
			PreparedStatement pst3 = conn.prepareStatement("Insert into wish_cart_info (buyer_id, prod_id, status, amount)values (?,?,0,1)");
			System.out.println(uid+" "+pid);
			pst3.setInt(1,uid);
			
			pst3.setInt(2,pid_);
			pst3.executeUpdate();
		}				
%> 
<script>
	alert("This Product is added to your wish list.")
	history.go(-1); </script>
<%
	}catch(Exception e){
		out.println(e.toString());
	}
%>