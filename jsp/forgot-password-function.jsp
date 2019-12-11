<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="org.apache.commons.lang3.RandomStringUtils" %>
<%
int classification;
String user_name = "";
try {
	String id = request.getParameter("id");
	String email = "";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root");
	PreparedStatement pst = conn.prepareStatement("Select email from user_info where id=?");
	pst.setString(1, id);
	// user_info table schema (user_number(PK), id, password, name, email, classification)
	ResultSet rs = pst.executeQuery();
	// If there's such a user, then move to another website
	if (rs.next()) {
		email = rs.getString("email");
		
		// Send email to user, SMTP connection
		String server = "smtp.gmail.com";
		// Personal google acount information
		String eid = "/*** Google ID ***/";
		String epassword = "/*** Corresponding password ***/";
		// Set properties of connection (host, auth, port, ssl)
		Properties p = new Properties();
		p.put("mail.smtp.host", server);
		p.put("mail.smtp.auth", true);
		p.put("mail.smtp.port", 587);
		p.put("mail.smtp.starttls.enable", true);
		// Set random password
		String rpassword = RandomStringUtils.randomAlphanumeric(10);
		
		// User authentication for the server
		Session s = Session.getInstance(p, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(eid, epassword);
			}
		});
		
		try {
			Message msg = new MimeMessage(s);
			msg.setFrom(new InternetAddress("admin@fm.skku.edu", "SKKU Flea Market"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			msg.setSubject("[SKKU Flea Market] New password is arrived.");
			msg.setText("New password: " + rpassword + "\nPlease change it after you log in successfully.");
			Transport.send(msg);		
		} catch(Exception e) {
			System.out.println(e.toString());
			System.out.println("Email sending error");
		}
		
		pst = conn.prepareStatement("Update user_info set password=? where id=?");
		pst.setString(1, rpassword);
		pst.setString(2, id);
		// user_info table schema (user_number(PK), id, password, name, email, classification)
		int rr = pst.executeUpdate();
		// Alwayrs rr value is 1
		
		response.sendRedirect("forgot-password.jsp?lErr=Email is send. Please check and login.");
	}
	// There's no matching user. Back to log-in site
	else {
		response.sendRedirect("forgot-password.jsp?lErr=There's no matching user information.<br>Please Sign Up.");
	}
} catch(Exception e) {
	out.println("Something went wrong !! Please try again");
}
%>