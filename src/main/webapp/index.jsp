<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable = no">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>Parkin</title>
    <link rel="icon" href="../assets/images/Logo.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<header>
    <!-- header -->
    <div class="header_logo">
        <img id="head_logo" src="assets/images/logo.png" alt="logo">
    </div>

    <nav id="nav">
        <!-- Navigation links -->
        <a href="#">Home</a>
        <a href="leaser-log.jsp">Leaser</a>
        <a href="Tenant-log.jsp">Tenant</a>
        <a href="about.jsp">About</a>
    </nav>

    <div class="respons_nav">
        <i class="fa-solid fa-bars" id="bttn"></i>
        <div class="menu-list">
            <a href="#">Home</a>
            <a href="leaser-log.jsp">Leaser</a>
            <a href="Tenant-log.jsp">Tenant</a>
            <a href="about.jsp">About</a>
        </div>
    </div>
</header>

<body>
    <main>
        <div class="main_container">
            <!-- main section -->
            <div class="head_line">
                <h1 id="hde1">Get vehicle Parking for Time rent</h1>
                <h2 id="hde2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Find Parking place on Map Near you</h2>
                <div id="search">
                    <!-- Map_search -->
                    <a href="https://www.google.com/maps/search/parking+garage/@13.0350916,80.2062335,12z/data=!3m1!4b1"
                        rel="noopener" target="_blank">
                        <!-- <h4 id="arrow">&#8681;</h4> -->
                        <h3 id="map"> &#8688;&nbsp;Search</h3>
                    </a>
                </div>
            </div>
    </main>
    <div class="child1">
        <img id="gif1" src="assets/images/parkplace.gif" alt="img">
        <div class="ct"><br>
            <h4 id="cot">Check nearest available parking spaces here<br>
                Get affortable garage or parking place<br> on rent for your vehicle.
            </h4>
        </div>
    </div>
    <div class="faq">
        <h3 id="q">FAQ</h3><br>
        <p id="qt">(Click the question and get the answer)</p>
    </div><br>
    <div id="faq">
        <button class="accordion">Who is leaser?</button>
        <div class="panel">
            <p>The person who had a parking place</p>
        </div>

        <button class="accordion">Who is Tenant?</button>
        <div class="panel">
            <p>The person who had a Bike or car.</p>
        </div>

        <button class="accordion">How this website is helping for leaser?</button>
        <div class="panel">
            <p>Leaser can generate money from Unused land of their own using this website.</p>
        </div>

        <button class="accordion">How this website is helping for Tenant?</button>
        <div class="panel">
            <p>Tenant can find the good and secure parking place in their nearby location<br> with in a minute.</p>
        </div>
    </div>

    <div class="child2">
        <img id="gif2" src="assets/images/placepark.gif" alt="img">
        <div class="fq"><br>
            <h4 id="cont">Take advantage of unused space in your home or <br>office in order to earn money.
                Get in touch with<br> people quickly for parking needs.
            </h4>
        </div>
    </div>
    <div class="leas">
        <img id="rt" src="assets/images/rent.png" alt="img">
    </div>
    <div class="bimg">
        <div class="hd">
            <h3 id="tpic">Rent out your home's Empty space or Garage</h3>
        </div>
    </div>
    <div id="feed">
        <div id="fdbx">
            <img id="phone" src="assets/images/phon.png" alt="phone">
            <form id="formm">
                <h2 id="ask">Ask us anything you want</h2><br>
                <label for="fname">Name</label>
                <input type="text" id="feedname" name="firstname" placeholder="Your name.."><br><br>
                <label for="email">Email</label>
                <input type="email" id="feedemail" name="user_email" placeholder="Your Email"><br><br>
                <label for="subject">Feedback</label>
                <textarea id="fedname" name="subject" placeholder="Write your Feedback.." style="height:80px"></textarea>
            </form>

        </div>
        <button id="btn">Get answers</button>
    </div>
</body>
<br>
<footer>
    <div id="foot">
        <div id="park">
            <img id="flogo" src="assets/images/lgo.png" alt="logo">
            <p>Parkin is an website that helps<br> to connect both Tenant and Leaser</p>
        </div>
        <div id="contact"><br>
            <h2>Get in touch</h2>
            <img id="flt" src="assets/images/lt.png" alt="symbol">
            <div id="ct">
                <h5 id="fc">Taramani,chennai</h5><br>
                <h5 id="ftc">parkinn2023.sri@gmail.com</h5>
            </div>
        </div>
        <div id="ftnav"><br>
            <a href="#">Home</a><br>
            <a href="leaser-log.jsp">Leaser</a><br>
            <a href="Tenant-log.jsp">Tenant</a><br>
            <a href="about.jsp">About</a><br>
        </div>
    </div>
    <div id="blk">
    </div>
</footer>
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function () {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }

    let form = document.querySelector("#btn")

    form.addEventListener("click" , function() {

      Email.send({
      Host: "smtp.elasticemail.com",
      Username: "srikann.2003@gmail.com",
      Password: "4DB5AD9DEC3E8A5B5E3951B381AC456C5CBD",
      To: 'parkinn2023.sri@gmail.com',
      From:"srikann.2003@gmail.com",
      Subject: "User Feedback",
      Name :document.getElementById("feedname").value,
      User_Email : document.getElementById("feedemail").value, 
      Body: document.getElementById("fedname").value
    }).then(
      message => alert(message)
    );

    })

</script>

</html>