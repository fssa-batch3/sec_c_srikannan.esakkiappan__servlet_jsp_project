<html>
<link rel="stylesheet" href="assets/css/notify.css">
<script
	src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js">
</script>
<body>
<%
	String success = (String) request.getAttribute("success");
	String error = (String) request.getAttribute("error");
	%>


	<%
	if (error != null) {
	%>
	<script>
		    let error = "<%=error%>";
		    Notify.error(error);
		</script>
	<%
	}
	%>

	<%
	if (success != null) {
	%>
	<script>
	    	let success = "<%=success%>";
			Notify.success(success);
		</script>
	<%
	}
	%>
	<h1>Parking place added sucessfully</h1>


</body>
</html>
