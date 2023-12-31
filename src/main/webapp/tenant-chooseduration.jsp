<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable = no">
<link
	href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;600;800&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="assets/css/tenant-choosetime.css">
	<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Include Bootstrap CSS and JavaScript -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="icon" href="assets/images/Logo.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



<!-- Include Bootstrap Datetimepicker CSS and JavaScript -->
<link rel="stylesheet" href="assets/vendor/bootstrap-datetimepicker.css">
<script src="assets/vendor/bootstrap-datetimepicker.js"></script>


<title>parkin</title>
</head>

<body>
	<!-- header -->
	<header>
		<!-- header -->
		<div class="header_logo">
			<img id="head_logo" src="assets/images/lgo.png" alt="logo">
		</div>
		<nav id="nav">

			<!-- Navigation links -->
			<a href="/parkinapp-web/ListPlace">Explore other places</a> <a
				href="index.jsp">Log out</a>

		</nav>
		<div class="respons_nav">
			<i class="fa-solid fa-bars" id="bttn"></i>
			<div class="menu-list">
				<a href="/parkinapp-web/ListPlace">Explore places</a> <a
					href="index.html">Log out</a>
			</div>
		</div>

	</header>
	<!-- main -->
	<main>
		<!-- parking images -->
		<div class="images">
			<div id="heading">Parking place Image</div>
			<br>
			<div>
				<img alt="" height="255px" width="430px" id="parking_image1">
			</div>
		</div>
		
		<!-- Leaser details -->
		<div class="leaser_detail">
		
			 <div id="name-number">
                <p>Name: <span id="leaser_name"></span></p><br>
                <p>Phone&nbsp;Number:<span id="leaser_number"></span></p>
            </div>
			<!-- Time choosing space -->
			<form action="<%=request.getContextPath()%>/BookingPlaceServlet"
				method="post">
				<h3>Choose the duration of your parking :</h3>
				
				  <br> <label
					for="time-start">Start-time</label>&nbsp;&nbsp;&nbsp; <input
					class="tim" type="text" id="start-time" name="startDate"
					placeholder="Select your parking time" required><br>
				<br> <label for="time-end">End-time</label>&nbsp;&nbsp;&nbsp; <input
					class="tim" type="text" id="End-time" name="endDate"
					placeholder="Select your parking time" required><br>
				<br> <br>
				<!-- request button -->
				<button id="request-btn">Give Request</button>
				<input id="leaser-email" type="hidden" name="leaserid" >
				<div id="cost">
				<button id="ques">How much</button>
				<div class="money">
					<div id="amount">
						Rs: <span id="rupee"></span>
						<input id="parkingcharge" type="hidden" name="parkingcharge">
					</div>
				</div>
				</div>
			</form>

		</div>
	</main>
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
					<h5 id="ftc">www.parkin.com</h5>
				</div>
			</div>
			<div id="ftnav">
				<br> <a href="index.jsp">Home</a><br> <a href="leaser-log.jsp">Leaser</a><br>
				<a href="Tenant-log.jsp">Tenant</a><br> <a href="about.jsp">About</a><br>
			</div>
		</div>
		<div id="blk"></div>
	</footer>
</body>
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
#heading{
    font-size: 27px;
    /* text-align: center; */
    margin-left: 19%;
    margin-top: 1%;
    color: black;
}
	main{
    margin-top: 110px;
    display: flex;
    flex-direction: row;
   	width:100%;
}
#name-number{
    font-size: 20px;
    margin-left: 60px;
    margin-top: -8%;
}
h3{
    font-size: 23px;
}
.leaser_detail{
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    width:500px;
   	height: 600px;
    margin-bottom: 100px;
    margin-left: 15%;
    margin-top: 10%;
    border-top-left-radius: 60px;
    border: 3px solid #0182ff;
    background-color: #f2f2f2;
    color: black;
    font-size: 20px;
}
label{
    font-size: 21px; 
}
input{
    height: 30px;
    width: 200px;
    border-radius: 10px;
    font-size: 18px;
}
form{
    margin-left: 60px;
    margin-top: 2%;
    font-size: 20px;
}
.images{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 10%;
}
button#ques{
    width: 40%;
    height: 28%;
    margin-left: 4%;
    font-size: 16px;
    font-weight: 400;
}
#cost{
	margin-top:-30%;
	margin-right: 28%;
	height: 54%;
	width: 90%;
}
#amount{
    width: 130%;
    margin-top: -13%;
    font-size: 18px;
}
#request-btn{
    margin-top: 10%;
    margin-left: 63%;
    height: 24%;
    font-size: 16px;
}
.money{
    margin-left: 85%;
    margin-top: -9%;
    transform: scale(1.6);
}
</style>

<script>

$(document).ready(function () {
    $('.tim').datetimepicker({
        format: 'yyyy-mm-dd HH:ii P',
        showMeridian: true,
        startDate: new Date()
    });
    $('.tim').datetimepicker('update', new Date())
});


const url = window.location.search;
const urlParams = new URLSearchParams(url)
let leaserId = urlParams.get('leaserid');
console.log(leaserId);
getUserDetails() ;
function getUserDetails() {
	const url = "http://localhost:8080/parkinapp-web/GetLeaserByEmail?leaserid=" + leaserId;
	axios.get(url)
	  .then(function (response) {
	    // handle success
	    console.log(response.data);
	    const user = response.data;
	    console.log(user);
	    displayUser(user);
	  })
	  .catch(function (error) {
	    // handle error
	    console.log(error);
	  })
}
	
	function displayUser(user) {
		
		
	let first_name = document.getElementById("leaser_name")
    let phon_num = document.getElementById("leaser_number")
    let parkin_img = document.getElementById("parking_image1")
    let leaser_mail = document.getElementById("leaser-email")

    first_name.innerText = user.firstName;
    phon_num.innerText = user.phoneNum;
    parkin_img.setAttribute("src", user.placephotourl );
    leaser_mail.value = user.userId;
	}
	
	document.getElementById("ques").addEventListener("click", e => {
	    let star_time = document.getElementById("start-time").value;
	    let end_time = document.getElementById("End-time").value;
		let parking_charge = document.getElementById("parkingcharge");
	    
	    console.log(star_time);

	    e.preventDefault();

	    //time to money

	    let date_start = star_time.substring(8, 10)
	    let date_star = Number(date_start);
	    console.log(date_star);

	    let date_end = end_time.substring(8, 10)
	    let date_ed = Number(date_end);

	    let date_diff = date_ed - date_star;
	    console.log(date_diff);

	    let datdf = date_diff * 24 * 100;
	    console.log(datdf);

	    let stq = meridiancheck(star_time);
	    console.log(stq);
	    let edq = meridiancheck(end_time);
	    console.log(edq);


	    let min = (edq - stq);
	    console.log(min);

	    let mi = datdf + min;
	    console.log(mi);

	    if (date_diff === 0) {
	        let out = Numtomin(min);

	        minut = convertH2M(out);
	        console.log(minut);

	        money = Math.round(minut / 7);
	        parking_amount = money;
	    }

	    else if (date_diff > 0) {
	        let out = Numtomin(mi);
	        console.log(out);
	        
	        minut = convertH2M(out);
	        console.log(minut);

	        money = Math.round(minut / 9);
	        parking_amount = money;
	    }


	    let tim = minut / 60;
	    duration_hours = Math.floor(tim);

	    document.getElementById("rupee").innerText = money;
	    parking_charge.value = money;
	})

	function meridiancheck(j) {
	    let mer = j.substring(17, 19);

	    let end = j.substring(11, 16)
	    end = end.split(":")

	    if (mer === "PM") {
	        let d = Number(end[0]) + 12;
	        let ed = Number(d + end[1]);
	        return ed;
	    }
	    else {
	        let ed = Number(end[0] + end[1]);
	        return ed;
	    }
	}

	function Numtomin(mi) {

	    let minu = String(mi);

	    if (minu.length === 3) {
	        minu = "0" + minu;
	    }
	    else if (minu.length === 2) {
	        minu = "00" + minu;
	    }
	    else if(minu.length === 1){
	        minu = "000" + minu;
	    }
	    var u = ":";
	    var output = [minu.slice(0, 2), u, minu.slice(2)].join('');
	    return output;

	}

	function convertH2M(th) {
	    var thpart = th.split(":");
	    return Number(thpart[0]) * 60 + Number(thpart[1]);
	}
    
</script>

</html>