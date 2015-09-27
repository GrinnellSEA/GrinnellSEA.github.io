---
title: GSEA Administration
---

## Interest Survey
New members---please fill out [this interest survey](https://docs.google.com/forms/d/1hbgW_l3n2HQUzWB5rlXyv5gJFXY0-ZD7rmXqbbgr6tU/viewform).

## Mission Budgets

[Near-Space Balloon Project Budget](/assets/balloon-budget.pdf)I

## Login

<span id="membercontent"></span>

<span id="loginform">
<input type="password" id="password" placeholder="Password" /> 
<button id="loginbutton">Login</button> <br />
Stay signed in? 
<input type="checkbox" checked id="staysignedin" />
</span>
<button id="signout" style="display: none">Sign Out</button>

<script type="text/javascript" src="/js/sha256.js"></script>
<script type="text/javascript">
	registerFunction(function() {
		var onlogin = function() {
				xhr("/administration/membersonly.html", function(content) {
					$("#membercontent").innerHTML = content;
				});

				$("#login").remove();
				$("#loginform").remove();
				$("#signout").style.display = "block";
		};

		var checkPassword = function(password) {
			var correct = "pGN3w+MArM2L4HQODi7aCrWef+L9a6O6WwulvY7B/1U=";
			var sha = new jsSHA("SHA-256", "TEXT");
			sha.update(password);
			var hash = sha.getHash("B64");
			if (hash === correct) {
				if ($("#staysignedin").checked) {
					localStorage.password = password;
				}

				onlogin();
			}
		};

		$("#loginbutton").onclick = function() {
			checkPassword($("#password").value);
		};

		$("#signout").onclick = function() {
			localStorage.password = undefined;
			location.reload();
		};

		$("#password").onkeypress = function(e) {
			if (e.keyCode === 13) {
				$("#loginbutton").click();
			}
		};

		checkPassword(localStorage.password);
	 });
</script>
