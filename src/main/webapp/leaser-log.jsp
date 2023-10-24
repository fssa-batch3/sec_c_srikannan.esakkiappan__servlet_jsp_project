<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Labrada:wght@400;500;600&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;600;800&display=swap" rel="stylesheet">
  <title>Parkin</title>
  <link rel="icon" href="assets/images/Logo.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="assets/css/login-style.css">

</head>
 <link rel="stylesheet" href="assets/css/notify.css">
 <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js">
</script>

<body>
	
  <header>
  
    <!-- header -->
    <div class="header_logo">
        <img id="head_logo" src="assets/images/lgo.png" alt="logo">
    </div>
    
    <nav id="nav">
        <!-- Navigation links -->
        <a href="index.jsp">Home</a>
        <a href="leaser-log.jsp">Leaser</a>
        <a href="Tenant-log.jsp">Tenant</a>
        <a href="about.jsp">About</a>
    </nav>
    <div class="respons_nav">
      <i class="fa-solid fa-bars" id="bttn"></i>
      <div class="menu-list">
        <a href="index.jsp">Home</a>
        <a href="leaser-log.jsp">Leaser</a>
        <a href="Tenant-log.jsp">Tenant</a>
        <a href="about.jsp">About</a>
      </div>
    </div>
</header>

<%
	String success = (String) request.getAttribute("success");
	String error = (String) request.getAttribute("error");
	System.out.println(error);
	%>

	<%
	if (error != null) {
	%>
	<script>
	    let error = "<%=error%>";
	    Notify.error(error);
	</script>
	<%
	}
	%>

	<%
	if (success != null) {
	%>
	<script>
	    	let success = "<%=success%>";
	    	console.log("<%=success%>");
			Notify.success("<%=success%>");
	</script>
	<%
	}
	%>

  <div id="hd"><br>
    <a href="index.jsp" id="bak-hom">Back to Home</a>
  </div>
  <main>
    <h2 class="content-leftside"> &nbsp; &nbsp; &nbsp; If you have an unused parking space,<br> Garage or piece of land
      that you are not using,<br>
      &nbsp; &nbsp; you can rent your parking space using
      <br>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
      &nbsp; &nbsp; &nbsp;Parkin.com
    </h2>


    <!-- login box -->
    <form class="formm" method="post" action="LoginServlet">
      <div class="imgcontainer">
        <img src="assets/images/leaser-log-imag.png" alt="Avatar" class="avatar-img">
      </div>
      <div class="container1">
        <label for="uname"><b>Email</b></label>
        <input id="emai" type="email" value="ram2002@gmail.com" placeholder="Email" name="email" required><br><br>

        <label for="psw"><b>Password</b></label>
        <input id="password" type="password" value="Ram@2002" name="password" placeholder="Enter Password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Your password must be at least 8 characters long, contain at least one digit or special character, one uppercase letter, and one lowercase letter, and must not contain dots or newline characters." required><br>

        <button type="submit" id="log">Login</button><br>
      </div>
      <div class="container2">
        <a id="cancelbtn" href="index.jsp"> cancel</a>
        <div><a id="forgot-password" href="#">Forgot password?</a></div>
      </div>
    </form>
  </main>
  <div class="sign">
    <h3>
      If you are a new user create a account using
    </h3><br><br>
    <a id="sign-up" href="signup.jsp">Sign up</a>
  </div>
 
</body>

</html>