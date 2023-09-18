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
    <link rel="stylesheet" href="assets/css/profile.css">
    <link rel="icon" href="assets/images/Logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>parkin</title>
</head>
<body>
    <header>
        <!-- header -->
        <div class="header_logo">
            <img id="head_logo" src="assets/images/lgo.png" alt="logo">
        </div>
        <!-- <a id="h" href="#">Home</a> -->
        <h1 id="lf">Leaser profile</h1>
        <nav id="nav">
            <!-- Navigation links -->
            <a href="leaser-notification.jsp">Requests</a>
            <a href="leaser-edit.jsp" id="edi">Edit profile</a>
            <a href="index.jsp">Log out</a>
        </nav>
        <div class="respons_nav">
            <i class="fa-solid fa-bars" id="bttn"></i>
            <div class="menu-list">
            <a href="leaser-notification.jsp">Requests</a>
            <a href="leaser-edit.jsp" id="edi">Edit profile</a>
            <a href="index.jsp">Log out</a>
            </div>
        </div>
</header>
    <!-- main -->
    <main>
    <%
	User user= (User) session.getAttribute("currentuser");
	String displayName = user.getFirstName();
	String address = user.getAddress();
	String phone = user.getPhoneNum();
	String imgurl = user.getPlacephotourl();
	%>
        <!-- <div id="head">My profile</div>
        <button id="edi" >Edit</button> -->
        <div class="profile">
            <div id="avatar_img"></div>
            <img id="def_img" src="assets/images/upload_template.jpeg" alt="upload_template">
            <div class="details">
            <h3 id="name">Name:&nbsp;&nbsp;<span id="input1"><%=displayName != null ? displayName : ""%></span></h3>
            <h3 id="phn">Phone number:&nbsp;&nbsp;<span id="input2"><%=phone != null ? phone : ""%></span></h3>
            <h3 id="addres">Address:&nbsp;&nbsp;<span id="input3"><%=address != null ? address : ""%></span></h3>
            </div>
        </div>
        <!-- <div id="bike-img"> -->
            <div id="park_place"><img id="plac_img" src="<%=imgurl %>" alt="<%= displayName %>" height=400px width=600px></div>
    </main>
 
</body>