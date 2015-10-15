---
---

registerFunction ->
	$("#loginbutton").onclick = () ->
		password = $("#password").value
		if $("#staysignedin").checked
			localStorage.password = password
		
		if getAuth(password)
			# redirect to previous page
			location.href = location.search.split("=")[1] || "/"
		else
			$("#message").style.display = "block"
			$("#message").innerHTML = "Password incorrect."
		

	$("#password").onkeypress = (e) ->
		if (e.keyCode == 13)
			$("#loginbutton").click()
