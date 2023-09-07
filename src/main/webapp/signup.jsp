<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.fssa.parkinplace.model.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;600;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/signup.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Parkin</title>
  <link rel="icon" href="../assets/images/Logo.png">
</head>

<link rel="stylesheet" href="assets/css/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js">
</script>
<body>
<%
	String success = (String) request.getAttribute("success");
	String error = (String) request.getAttribute("error");
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
			Notify.success(success);
		</script>
	<%
	}
	%>
  <header>
    <!-- header -->
    <div class="header_logo">
      <img id="head_logo" src="https://iili.io/HyP0C8b.png" alt="logo">
    </div>
    
    <div class="respons_nav">
      <i class="fa-solid fa-bars" id="btttn"></i>
      <div class="menu-list">
      <a href="leaser-profile.html" id="save">Save</a>
      <a href="leaser-log.html" id="del">Delete</a>
      <a href="../index.html">Log out</a>
      </div>
    </div>

  </header>
  <div id="hed">
    <h2>Leaser Signup</h2>
  </div>
  <div class="container">
    <form method="post" action="UserRegister">
      <div class="row">
        <div class="col-25">
          <label for="fname">First Name</label>
        </div>
        <div class="col-75">
          <input type="text" id="fname" value="Ramkumar" required name="name" placeholder="Your name.." >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="email">Email</label>
        </div>
        <div class="col-75">
          <input type="email" id="email" name="email" value="ram2002@gmail.com" placeholder="Your email.."
            pattern="^[a-zA-Z0-9][a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Phone number</label>
        </div>
        <div class="col-75">
          <input type="number" id="numb" value="9321850134" required placeholder="Your phone number.." name="phone" pattern="[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}" >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Address</label>
        </div>
        <div class="col-75">
          <textarea id="subject" value="raniyammalnagar" required name="address" placeholder="your home parking place address.."  style="height:50px">21,Sumangali school,Swaminathan Street,Guduvancheri</textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Parking location</label>
        </div>
        <div class="col-75">
          <textarea id="sub" name="mapUrl" required value="https://maps.app.goo.gl/kJ7erasDKda9D8LYA" placeholder="location link"  style="height:40px">https://maps.app.goo.gl/orndAzptj1YPPHwf6</textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="pass" value="Ram@2002" required name="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Land Image</label>
        </div>
        <div class="col-75">
          <input type="url" id="land_img" name="photoUrl" required value="https://iili.io/J9lZkZv.jpg" accept="image/jpeg, image/png, image/jpg"><br>
          
  
        </div>
      </div>
      

      <div class="row">

        <input type="submit" value="sign up">
      </div>

    </form>
</body>
</html>