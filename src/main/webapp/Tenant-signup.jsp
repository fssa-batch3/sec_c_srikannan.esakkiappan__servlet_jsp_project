<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.fssa.parkinplace.model.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, user-scalable = no">
  <link href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;600;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/signup-edit.css">
  <link rel="icon" href="assets/images/Logo.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Parkin</title>
</head>

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
  <div id="hed">
    <h2 id="hedi">Tenant Registration</h2>
  </div>
  <div class="container">
    <form method="post">
      <div class="row">
        <div class="col-25">
          <label for="fname">Name</label>
        </div>
        <div class="col-75">
          <input type="text" id="fname" name="name" placeholder="Your First name.." pattern="[a-zA-Z]+" required>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="email">Email</label>
        </div>
        <div class="col-75">
          <input type="email" id="email" name="email" placeholder="Your Email" required>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Phone number</label>
        </div>
        <div class="col-75">
          <input type="tel" id="numb" name="phone" placeholder="Enter your number" title="please enter a valid phone number" required
            minlength="10" maxlength="10">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Address</label>
        </div>
        <div class="col-75">
          <textarea id="subject" name="address" placeholder="Enter your Address.." required></textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="pass" name="password"
            title="Password length must be atleast 8, and must contain atleast 1 uppercase, 1 lowercase character and 1 digit"
            pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Confirm Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="password" name="cpassword"
            title="Password length must be atleast 8, and must contain atleast 1 uppercase, 1 lowercase character and 1 digit"
            pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
        </div>
      </div>
      
      <div class="row">
        <div class="col-25">
          <label for="name">Bike Image</label>
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

<script type="text/javascript">
	let form = document.querySelector("form");
	
	let password = document.getElementById("pass").value;
    let confirmPassword = document.getElementById("password").value;
    
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        console.log("running");
        if (password != confirmPassword) {
        	alert("password and confirmPassword not matched");
        }
        else if(password.trim().length == 0){
        	console.log(confirmPassword);
        	console.log(password);
        	alert("password is invalid");
        }
        else{
            form.setAttribute("action", "/TenantRegister");
            
            form.submit();
        }
         
    });

</script>

</html>