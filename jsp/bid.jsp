<%@ page import="java.sql.*"%>
<%
	String id = session.getAttribute("id").toString();
	String bidprice_temp = request.getParameter("bidprice"); 
	String curprice_temp = request.getParameter("cur_price"); 
	double bidprice=Double.parseDouble(bidprice_temp);
	String temp=request.getParameter("pid");
	temp = temp.replaceAll(" ", "");
	curprice_temp= curprice_temp.replaceAll(" ", "");
	double cur_price=Double.parseDouble(curprice_temp);
	System.out.println(temp);
	int pid = Integer.parseInt(temp);
	int uid=0;
	double unit=0;
	
	if(cur_price>bidprice){
		%>
		<script>
		alert("Please enter the price larger than current bid price.");
		history.go(-1); 
		</script>
			<% 
	}else{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
		PreparedStatement pst = conn.prepareStatement("Select * from user_info where id=?");
		pst.setString(1,id);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			uid=rs.getInt("uid");
		}
		PreparedStatement pst2 = conn.prepareStatement("Select * from product_info where pid=?");
		pst2.setInt(1,pid);
		ResultSet rs2 = pst2.executeQuery();
		if(rs2.next()){
			unit=rs2.getDouble("unit");
		}
		if(bidprice%unit!=0){
	%>
<script>
alert("Please check the unit price. You can enter the multiple of bid unit.");
history.go(-1); 
</script>
	<% 
		}else{
			
			PreparedStatement pst1 = conn.prepareStatement("Insert into history (pid, buyer_id, price) values (?,?,?)");	
			pst1.setInt(1,pid);
			pst1.setInt(2,uid);
			pst1.setDouble(3,bidprice);
			pst1.executeUpdate();
	%>
<script>
alert("You bid this product!");
history.go(-1); 
</script>	
	<%
		}	
	}catch(Exception e){
		System.out.println(e.toString());
	}
	}
	%>
			