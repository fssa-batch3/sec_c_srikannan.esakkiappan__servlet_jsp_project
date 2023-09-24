<%@page import="com.fssa.parkinplace.model.BookingPlace"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable = no">
<link
	href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;600;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/leaser-notify.css">
<link rel="icon" href="assets/images/Logo.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>parkin</title>
</head>

<body>
	<!-- Header -->
	<header>
		<div class="logo">
			<img id="logo" src="assets/images/lgo.png" alt="logo">
		</div>
		<!-- Notification links -->
		<nav id="nav">
			<a href="about.jsp">About</a> <a href="#contact">Contact</a> <a
				href="index.jsp">Back to Home</a>
		</nav>
		
	</header>
	<!-- Main -->
	<main>
		<!-- New request -->
		<div class="present_box"></div>
		<!-- history -->
		<div class="history_box">
		<!-- 	<div id="histo">History</div>-->

		</div>
	</main>
	<br>
	<br>
	<!-- footer -->
	<footer>
		<div id="foot">
			<div id="park">
				<img id="flogo" src="assets/images/lgo.png" alt="logo">
				<p>
					Parkin is an website that helps<br> to connect both Tenant and
					Leaser
				</p>
			</div>
			<div id="contact">
				<h2>Get in touch</h2>
				<img id="flt" src="assets/images/lt.png" alt="symbol">
				<div id="ct">
					<h5 id="fc">Taramani,chennai</h5>
					<br>
					<h5 id="ftc">parkinn2023.sri@gmail.com</h5>
				</div>
			</div>
			<div id="ftnav">
				<br> <a href="#">Home</a><br> <a href="leaser-log.jsp">Leaser</a><br>
				<a href="Tenant-log.jsp">Tenant</a><br> <a href="about.jsp">About</a><br>
			</div>
		</div>
		<div id="blk"></div>
	</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">



function getAllAccounts() {
	const url = "http://localhost:8080/parkinapp-web/LeaserNotification";
	axios.get(url)
	  .then(function (response) {
	    // handle success
	    console.log(response);
	    const reqDet = response.data;
	    console.log(reqDet);
	    displayDetails(reqDet);
	  })
	  .catch(function (error) {
	    // handle error
	    console.log(error);
	  })
}

getAllAccounts();

function formatDateAndTime(inputDate) {
	  // Parse the input date string
	  const date = new Date(inputDate);

	  // Get components
	  const year = date.getFullYear();
	  const month = (date.getMonth() + 1).toString().padStart(2, '0'); // Month is 0-based
	  const day = date.getDate().toString().padStart(2, '0');
	  let hours = date.getHours();
	  const minutes = date.getMinutes().toString().padStart(2, '0');
	  const amPm = hours >= 12 ? 'PM' : 'AM';

	  // Convert to 12-hour format
	  if (hours > 12) {
	    hours -= 12;
	  } else if (hours === 0) {
	    hours = 12;
	  }

	  // Format as desired (e.g., "2023-09-24 07:53 PM")
	  const formattedDate = `\${year}-\${month}-\${day}`;
	  const formattedTime = `\${hours}:\${minutes} \${amPm}`;

	  return `\${formattedDate} \${formattedTime}`;
	}

function displayDetails(reqDet) {
	
	let main_box = document.querySelector(".present_box")

	let histo = document.querySelector(".history_box")

	let nava;

	let image;
	let img;
	let detail;
	let p1;
	let p2;
	let rqdate;
	let parkdur;
	let amont;
	let htag;
	let but;

	let req_feed;

	let history;
	let him;
	let hi;
	let det;
	let hp;
	let hp1;
	let acp;
	
	main_box.innerHTML = '';
	
	let res = 1;

	if (reqDet.length > 0) {
	    htag = document.createElement("h2");
	    htag.setAttribute("id", "headi");
	    htag.innerHTML = `New Request`;
	    main_box.append(htag);

	    image = document.createElement("div");
	    image.setAttribute("class", "image");
	    main_box.append(image)

	    img = document.createElement("div")
	    img.setAttribute("id", "imge")
	    image.append(img)

	    detail = document.createElement("div")
	    detail.setAttribute("class", "detail")
	    main_box.append(detail)

	    p1 = document.createElement("p")
	    p1.setAttribute("id", "nam")
	    detail.append(p1)

	    p2 = document.createElement("p")
	    p2.setAttribute("id", "phon")
	    detail.append(p2)

	    rqdate = document.createElement("p")
	    rqdate.setAttribute("id", "redatm")
	    detail.append(rqdate)

	    parkdur = document.createElement("p")
	    parkdur.setAttribute("id", "dur")
	    detail.append(parkdur)

	    amont = document.createElement("p")
	    amont.setAttribute("id", "money")
	    detail.append(amont)

	    but = document.createElement("button")
	    but.setAttribute("id", "accept-html")
	    but.innerText = "Accept";
	    detail.append(but)
	}
	else {
	    req_feed = document.createElement("h2")
	    req_feed.innerText = "You dont have any request !"
	    main_box.append(req_feed)
	}
	
	console.log(reqDet);
	
	
	
	if (reqDet.length > 0) {
        for (let i = 0; i < reqDet.length; i++) {
            const request = reqDet[i];
            console.log(request);
            
            let startDate = formatDateAndTime(request.startingPeriod);
            let endDate = formatDateAndTime(request.endingPeriod);
            console.log(startDate);
            
        	p1.innerHTML = `<p> Name : \${request.tenantName} </p>`
        	p2.innerHTML = `<p> Phone number : \${request.tenantPhone} </p>`
        	img.innerHTML = `<img src="\${request.tenantBikeImg}" border="0" height=300px width=200px>`
        	rqdate.innerHTML = `<p> Starting Date and Time : \${startDate} </p>`
        	parkdur.innerHTML = `<p> Ending Date and Time : \${endDate}</p>`
        	amont.innerHTML = `<p> Your Receiving money : \${request.amount} </p>`
        }
	}
	
	but.addEventListener("click", function() {
		
		let id = reqDet[0];
		
		  // Define the URL you want to redirect to
		  const redirectUrl = "http://localhost:8080/parkinapp-web/AcceptBooking?bookingId="+ id; 
		  
		  // Perform the redirect
		  window.location.href = redirectUrl;
		});
	

}


</script>

<script src="https://smtpjs.com/v3/smtp.js"></script>
</html>