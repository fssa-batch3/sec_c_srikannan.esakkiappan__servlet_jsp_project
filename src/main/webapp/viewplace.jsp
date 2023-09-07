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

        const locat = document.getElementById("locat")
        locat.addEventListener("click", function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("Geolocation is not supported by this browser.")
            }
            function showPosition(position) {

                let latitud = position.coords.latitude
                let longitud = position.coords.longitude
                console.log(latitud, longitud); // 13.0963045  80.2865916

                let near="";
                for (let s = 0; s < lease.length; s++) {
                    let lat2 = lease[s]["Lattitude"];
                    let lon2 = lease[s]["Longitude"];

                    const distan_km = distance(latitud, longitud, lat2, lon2);
                    console.log(distan_km);

                    if (distan_km <= 1) {
                        console.log(lease[s]);
                        near += `<a id="link" href="tenant-chooseduration.html?name=${lease[s]["firstname"]}">
                            <div class="profile_box">
                              <div class="image">
                                <img id="imag" src="${lease[s]["upload_image"]}">
                              </div>
                             <div class="detail">
                                <p>Name : ${lease[s]["firstname"]}</p>
                                <p>Address : ${lease[s]["address"]}</p>
                                <p>Phone number : ${lease[s]["phone_number"]}</p>
                             </div>
                            </div>
                                </a>`
                        main_lists.innerHTML = near;
                        console.log("sucess");
                    }
                }
            }
        })

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