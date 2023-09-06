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

<body>
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
          <input type="text" id="fname" value="raj" name="name" placeholder="Your name.." >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="email">Email</label>
        </div>
        <div class="col-75">
          <input type="email" id="email" name="email" value="raj2002@gmail.com"
            pattern="^[a-zA-Z0-9][a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" required>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Phone number</label>
        </div>
        <div class="col-75">
          <input type="number" id="numb" value="9790850134" name="phone" pattern="[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}" >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Address</label>
        </div>
        <div class="col-75">
          <textarea id="subject" value="raniyammalnagar" name="address" placeholder="Write address.."  style="height:50px">raniyammalnagar</textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="subject">Parking location</label>
        </div>
        <div class="col-75">
          <textarea id="sub" name="mapUrl" value="https://maps.app.goo.gl/kJ7erasDKda9D8LYA" placeholder="location link"  style="height:40px">https://maps.app.goo.gl/kJ7erasDKda9D8LYA</textarea>
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Password</label>
        </div>
        <div class="col-75">
          <input type="password" id="pass" value="Raj@2002" name="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" >
        </div>
      </div>

      <div class="row">
        <div class="col-25">
          <label for="name">Land Image</label>
        </div>
        <div class="col-75">
          <input type="url" id="land_img" name="photoUrl" value="https://iili.io/HUN8VHX.jpg" accept="image/jpeg, image/png, image/jpg"><br>
          <small id="land_image">Land_img_url...</small>
          <a class="uplod" id="land_prev">Preview</a>
        </div>
      </div>
      
      <div id="display_image">

      </div>

      <div class="row">

        <input type="submit" value="sign up">
      </div>

    </form>
</body>
</html>