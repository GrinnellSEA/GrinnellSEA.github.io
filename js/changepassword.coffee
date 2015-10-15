---
---

registerFunction ->
	$("#submit").onclick = () ->
		account = $("select").value
		old = $("#old").value
		new1 = $("#new1").value
		new2 = $("#new2").value

		if account == ""
			$("#msg").innerHTML = "Please select an account."
			return false

		if new1 != new2
			$("#msg").innerHTML = "New passwords don't match."
			return false

		if getAuth(old) != "r_" + account
			$("#msg").innerHTML = "Password incorrect."
			return false

		if getAuth(localStorage.password) != "r_admin"
			$("form").innerHTML = "Not authorized."
			return false

		sha = new jsSHA("SHA-256", "TEXT")
		sha.update(new1)

		PASSWORDS[account] = sha.getHash("B64")

		repo = getRepository((e) -> $("form").innerHTML = e)

		try
			repo.write("master", "login/data.json", JSON.stringify(PASSWORDS), \
				"Changed #{account} password", LOGF)
		catch error

		if getAuth(abc) == "r_admin" # update OAuth encryption
			encr = sjcl.encrypt(new1, decrypt(token_encrypted, old, LOGF))
			try 
				repo.write("master", "login/oauth.json", encr, \
					"Updated OAuth with password change", LOGF)
			catch error

		if old == localStorage.password
			localStorage.password = new1

		$("form").innerHTML = "Password Changed."

		false
