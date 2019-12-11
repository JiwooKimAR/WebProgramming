<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>SKKU Flea Market | Login</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/forgot-password-style.css">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <%
	// For login error detection
	String err = (String)request.getParameter("lErr");
	if (err == null) {
		err = "";
	}	
  %>
    <div class="login-wrap">
      <div class="login-html">
        <div class="logo">
          <img src="img/core-img/logo.png">
        </div>
        <div class="login-form">
        <div class="description">Please, enter your <strong style="color:red">ID</strong>.<br> 
        Then we will send you an <strong style="color:red">email</strong> with new password.<br>
        After you login successfully,<br> please <strong style="color:red">change password</strong> for your security.
        </div>
        <form name="forgot-password" action="forgot-password-function.jsp" method="POST">
            <div class="group">
              <label for="user" class="label">ID</label>
              <input id="user" type="text" class="input" name="id">
            </div>
            <div class="group">
              <input type="submit" class="button" value="Send email">
            </div>
            <div class="foot-lnk">
            	<!-- Extra Function Implementation | When user forgot the password, they can find it -->
              <a href="login.jsp">Return to Login/Sign Up page</a>
            </div>
            <br><br><br><div class="description" style="color: red"><%=err %></div>
          </form>
        </div>
      </div>
    </div>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
  </body>
</html>
