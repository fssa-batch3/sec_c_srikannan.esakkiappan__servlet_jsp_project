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

				if (list != null) {
					for (int i = list.size() - 1; i >= 0; i--) {
						User ele = list.get(i);
				%>
				<a
					href="<%=request.getContextPath()%>/tenant-chooseduration.jsp?leaserid=<%=ele.getUserId()%>">
					<div class="profile_box">
						<div class="image">
							<img id="imag" src="<%=ele.getPlacephotourl()%>"
								alt="<%=ele.getFirstName()%>">
						</div>
						<div class="detail">
							<p id="nam">
							<p>
								Name :
								<%=ele.getFirstName()%></p>
							</p>
							<p id="addr">
							<p>
								Address :
								<%=ele.getAddress()%></p>
							</p>
							<p id="phon">
							<p>
								Phone number :
								<%=ele.getPhoneNum()%></p>
							</p>
						</div>
					</div>

				</a>
				<%
				}
				} else {
				%>
				<p>Empty</p>
				<%
				}
				%>

			</div>
		</div>

	</main>

	<script>

		let main_lists = document.querySelector(".main_list");

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
        
        const locat = document.getElementById("locat");
locat.addEventListener("click", function () {

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.")
    }

    function showPosition(position) {
		let latitud = position.coords.latitude;
		let longitud = position.coords.longitude;
		let accur = position.coords.accuracy;
		console.log(latitud, longitud);
		
		// Initialize listData as an empty array
		let listData = [];
		
		<%
        for (int i = list.size() - 1; i >= 0; i--) {
            User ele = list.get(i);
            // Use Gson to convert User object to JSON string
        %>
        listData.push(<%= new com.google.gson.Gson().toJson(ele) %>);
        <%
        }
        %>
		
		console.log(listData);
		
		let near = ''; // Initialize near as an empty string
	    
	    for (let s = 0; s < listData.length; s++) {
	        let lat2 = listData[s].latitude;
	        let lon2 = listData[s].longitude;
	        const distan_km = distance(latitud, longitud, lat2, lon2);

	        if (distan_km <= 5) {
	          
	            near += `<a id="link" href="<%=request.getContextPath()%>/tenant-chooseduration.jsp?leaserid=\${listData[s].userid}">
	                <div class="profile_box">
	                    <div class="image">
	                        <img id="imag" src="\${listData[s].placephotourl}">
	                    </div>
	                    <div class="detail">
	                        <p>Name : \${listData[s].name}</p>
	                        <p>Address : \${listData[s].address}</p>
	                        <p>Phone number : \${listData[s].phonenum}</p>
	                    </div>
	                </div>
	            </a>`;
	            main_lists.innerHTML = near;
	            console.log(distan_km);
	        }
	    }
	}
});
   
        
        function distance(lat1, lon1, lat2, lon2) {
            const R = 6371; // radius of the earth in km
            const dLat = deg2rad(lat2 - lat1);
            const dLon = deg2rad(lon2 - lon1);
            const a =
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
                Math.sin(dLon / 2) * Math.sin(dLon / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            const d = R * c; // distance in km
            return d;

        }

        function deg2rad(deg) {
            return deg * (Math.PI / 180)
        }
        
        
 
    </script>
</body>





</html>