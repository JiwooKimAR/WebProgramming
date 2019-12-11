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
    <link rel="stylesheet" href="css/login-style.css">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <%
  	// Don't show login page again when user already login
  	if (session.getAttribute("classification") != null) {
  		int c = (int)session.getAttribute("classification");
  		if (c == 0) {
  			response.sendRedirect("member_list.jsp");
  		}
  		// TODO: [JW] buyer and seller division
  		else if (c == 1) {
  			response.sendRedirect("index.jsp");
  		}
  		else {
  			response.sendRedirect("index.jsp");
  		}
  	}
  
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
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked="checked"><label for="tab-1" class="tab">Sign In</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
        <div class="login-form">
        <form name="signin" action="sign-in-middle.jsp" method="POST">
          <div class="sign-in-htm">
            <div class="group">
              <label for="user" class="label">ID</label>
              <input id="user" type="text" class="input" name="id">
            </div>
            <div class="group">
              <label for="pass" class="label">Password</label>
              <input id="pass" type="password" class="input" data-type="password" name="password">
            </div>
            <div class="group">
              <input id="check" type="checkbox" class="check" checked>
              <label for="check"><span class="icon"></span>Keep me Signed in</label>
            </div>
            <div class="group">
              <input type="submit" class="button" value="Sign In">
            </div>
            <div class="hr"></div>
            <div class="foot-lnk">
              <a href="#forgot">Forgot Password?</a>
            </div>
            <br><br><br><div class="group" style="color: red"><%=err %></div>
          </div>
          </form>
          <form name="signup" action="sign-up-middle.jsp" method="POST" onSubmit="return formCheck()">
          <div class="sign-up-htm">
            <div class="group">
              <div class="group-sign-up-user">
                <label for="user2" class="label">ID</label>
                <input id="user2" type="text" class="input" name="id2">
              </div>
              <!-- Extra Function Implement: Duplication test | Refer to "login.js", "duplicate-test.jsp" -->
              <div class="group-sign-up-user">
				<button type="button" class="button" onClick="javascript:dtest()" id="dupBtn">Duplicate</button>
              </div>
            </div>
            <div class="group">
              <label for="pass2" class="label">Password</label>
              <input id="pass2" type="password" class="input" data-type="password" name="password2">
            </div>
            <div class="group">
              <label for="name" class="label">Name</label>
              <input id="name" type="text" class="input" name="name">
            </div>
            <div class="group">
              <label for="email" class="label">Email Address</label>
              <input id="email" type="text" class="input" name="email">
            </div>
            <div class="group">
              <div class="group-checks">
                <div class="group-check">
                  <input type="radio" class="check" id="check1" name="type" value="buyer" checked="checked">
                  <label for="check1"><span class="icon"></span>Buyer</label>
                </div>
                <div class="group-check">
                  <input type="radio" class="check" id="check2" name="type" value="seller">
                  <label for="check2"><span class="icon"></span>Seller</label>
                </div>
              </div>
            </div>
            <div class="group">
              <input type="submit" class="button" value="Sign Up">
            </div>
            <div class="hr"></div>
            <!-- Extra Function Implement: Go to Sign in page -->
            <!-- Extra Function Implement: Reset the input form and button value -->
            <div class="foot-lnk">
              <label for="tab-1">Already Member?</label>
              <a href="javascript:reset();" id="reset">Reset</a>
            </div>
          </div>
          </form>
        </div>
      </div>
    </div>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
  </body>
</html>
