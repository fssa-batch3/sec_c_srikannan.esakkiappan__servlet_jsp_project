<%@page import="com.fssa.parkinplace.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/viewplace.css">
<title>Parkin</title>
</head>
<body>

	<header>
		<div class="logo">
			<img id="logo" src="https://iili.io/HyP0C8b.png" alt="logo">
		</div>
		<!-- Navigation link -->
		<nav id="nav">
			<input id="search" type="search"
				placeholder=" Use your location to search">
				<button id="locat">Near by</button>
		</nav>

	</header>
	<main>
		<div class="main">
			<div class="main_list">

				<%
					List<User> list = (List<User>) request.getAttribute("parkingPlaceList");
				    		
	
				if(list != null){
					for(int i=list.size()-1; i>=0; i-- ){
						User ele = list.get(i);
				%>
				<a href="<%=request.getContextPath() %>/tenant-chooseduration.jsp?tenantemail=<%=ele.getEmail() %>">
				<div class="profile_box">
					<div class="image">
						<img id="imag" src="<%=ele.getPlacephotourl() %>" alt="<%= ele.getFirstName() %>">
					</div>
					<div class="detail">
						<p id="nam">
						<p>Name : <%=ele.getFirstName() %></p>
						</p>
						<p id="addr">
						<p>Address : <%=ele.getAddress() %></p>
						</p>
						<p id="phon">
						<p>Phone number : <%=ele.getPhoneNum() %></p>
						</p>
					</div>
				</div>
				</a>
				<%	
					}
				}else{
				%>
				<p>Empty</p>
				<%
				}
				%>
				
			</div>
		</div>

	</main>


	<script>

        let search = document.getElementById("search");
        search.addEventListener("keyup", (e) => {

            let search_value = e.target.value.toLowerCase();
            let places = document.querySelectorAll(".profile_box");


            places.forEach(element => {
            	

                let details = element.children[1].children[4].textContent.toLowerCase();

                if (details.includes(search_value)) {

                    element.style.display = "flex";
                }
                else {

                    element.style.display = "none";
                }

            });

        })
        
        

       

    </script>
</body>



</html>