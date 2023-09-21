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
  <link rel="stylesheet" href="assets/css/signup-edit.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="assets/images/Logo.png">
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
      
      <a href="index.jsp">Log out</a>

    </nav>
    <div class="respons_nav">
      <i class="fa-solid fa-bars" id="btttn"></i>
      <div class="menu-list">
        <a href="tenant-profile.jsp" id="save">Save</a>
        <a href="tenant-log.jsp" id="del">Delete</a>
        <a href="index.jsp">Log out</a>
      </div>
    </div>
  </header>
  
    <%
	User user= (User) session.getAttribute("currenttenant");
	String displayName = user.getFirstName();
	String email = user.getEmail();
	String address = user.getAddress();
	String phone = user.getPhoneNum();
	String password = user.getPassword();
	String imgurl = user.getBikephotourl();
	
	%>
  
  <div id="hed">
    <h2>Edit your profile Info</h2>
  </div>
  <div class="container">
    <form method="post" action="UpdateTenantProfile">
      <div class="row">
        <div class="col-25">
          <label for="fname">Name</label>
        </div>
        <div class="col-75">
          <input type="text" id="fname" name="name" placeholder="Your name.." value="<%=displayName != null ? displayName : ""%>">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="email">Email</label>
        </div>
        <div class="col-75">
          <input type="email" id="email" value="<%=email != null ? email : ""%>" name="email" disabled>
          <input type="hidden" id="hiddenEmail" name="hiddenEmail" value="<%=email != null ? email : ""%>">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Phone number</label>
        </div>
        <div class="col-75">
          <input type="number" id="numb" name="phone" value="<%=phone != null ? phone : ""%>" name="phone"  pattern="[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Address</label>
        </div>
        <div class="col-75">
          <textarea id="subject" name="address" placeholder="Write something.." style="height:50px"><%=address != null ? address : ""%></textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="pass" name="password" value="<%=password != null ? password : ""%>" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Confirm Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="password" value="<%=password != null ? password : ""%>" name="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$">
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Bike Image</label>
        </div>
        <div class="col-75">
          <input type="url" id="bike_img" value="<%=imgurl != null ? imgurl : ""%>" name="image" accept="image/jpeg, image/png, image/jpg"><br>
          <small id="bike_image">Bike_img_url...</small>
          <a class="uplod" id="bike_prev">Preview</a>
        </div>
      </div>

      <div id="display_image">

      </div>
      
      <div class="row">

        <input type="submit" value="save">
      </div>

    </form>
   
</body>

</html>