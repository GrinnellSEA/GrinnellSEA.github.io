---
title: Login
---

<input type="password" id="password" placeholder="Password" /> 
<button id="loginbutton">Login</button> <br />
Stay signed in? 
<input type="checkbox" checked id="staysignedin" />

<script type="text/javascript">
	registerFunction(function() {
		var checkPassword = function(password) {
			var correct = "pGN3w+MArM2L4HQODi7aCrWef+L9a6O6WwulvY7B/1U=";
			var sha = new jsSHA("SHA-256", "TEXT");
			sha.update(password);
			var hash = sha.getHash("B64");
			if (hash === correct) {
				// redirect to previous page
				location.href = location.search.split("=")[1]; 				
			}
		};

		$("#loginbutton").onclick = function() {
			var password = $("#password").value;
			if ($("#staysignedin").checked) {
				localStorage.password = password;
			}
			checkPassword(password);
		};

		$("#password").onkeypress = function(e) {
			if (e.keyCode === 13) {
				$("#loginbutton").click();
			}
		};
	 });
</script>
