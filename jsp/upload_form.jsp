<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ page import = "java.sql.*" %>
<%
try {
   
   String title = request.getParameter("title");
  
   String place = request.getParameter("place");
   
   String user_name = session.getAttribute("id").toString();
   
   
   String phone = request.getParameter("phone").toString();
   
   int market = Integer.parseInt(request.getParameter("market"));
   
   
   
   double price1 = Double.parseDouble(request.getParameter("price1"));
   
   
  
   int price2 = Integer.parseInt(request.getParameter("price2"));
   
  
   String date = request.getParameter("due_date");
  
  
   String thumbnail = request.getParameter("thumbnail");
   
   String detail[] = request.getParameterValues("detail");
  // if(detail[0]=="")
//      System.out.println("hi");
 //  System.out.println(detail.length);
 
   String content = request.getParameter("content");
   
   // Administrator has different sign up process becuase of security
   // Normal sign up page is for only normal user.
   // Normal user can have 3 position: 1. buyer, 2. seller   
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
   // In "user_info" table, users have their unique key
   PreparedStatement pst = conn.prepareStatement("select max(pid) from product_info");
   ResultSet rs = pst.executeQuery();

   int count = 0;
   if (rs.next()) {
      count = rs.getInt(1) + 1;
   }   
   PreparedStatement pst2 = conn.prepareStatement("select * from user_info where id=?");
   pst2.setString(1,user_name);
   ResultSet rs2 = pst2.executeQuery();
   int user_id = 0;
   while(rs2.next()){
      user_id=rs2.getInt("uid");
   }

   pst = conn.prepareStatement("insert into product_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
   pst.setInt(1, count);
   pst.setString(2, title);
   pst.setInt(3, user_id);
   pst.setDouble(4, price1);   
   pst.setInt(5, price2);
   if(market==0) //flea market
   {
     pst.setInt(5,price2); 
      pst.setInt(6, 2);
      pst.setString(10, null);
      pst.setInt(12,1);
   }
   else  // auction
   {
     pst.setInt(5,1);
      pst.setInt(6,0);
      pst.setString(10, date);
      pst.setDouble(12,price2);
   }
   // if(price2==null)    pst.setInt(5, 1);
   pst.setString(7,place );
   pst.setString(8,phone );
   pst.setString(9, null );
   
   pst.setString(11, content );
  
   // user_info table schema (user_number(PK), id, password, name, email, classification)
   pst.executeUpdate();
   //************************************************************************************************************************Product_info update
   
   PreparedStatement ist = conn.prepareStatement("select max(iid) from img_info");
   ResultSet irs = ist.executeQuery();

   int icount = 0;
   if (irs.next()) {
      icount = irs.getInt(1) + 1;
   }   
   int img_len=detail.length;
   if(detail[0]=="")
      img_len=0;
   PreparedStatement pst3;
   pst3 = conn.prepareStatement("insert into img_info values (?, ?, ?)");
   pst3.setInt(1, icount);
   pst3.setString(2, "./img/product-img/"+thumbnail);   
   pst3.setInt(3, count);
   pst3.executeUpdate();
   for(int i=0;i<img_len;i++)
   {
      pst3 = conn.prepareStatement("insert into img_info values (?, ?, ?)");
      pst3.setInt(1, 1+icount+i);
      pst3.setString(2, "./img/product-img/"+detail[i]);   
      pst3.setInt(3, count);
      pst3.executeUpdate();
   }
   
   
   
   
} catch(Exception e) {
   out.println(e.toString());
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <meta http-equiv="refresh" content="1;url=product_list_seller.jsp">
</body>
</html>