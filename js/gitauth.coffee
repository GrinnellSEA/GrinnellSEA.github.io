---
---

window.token_encrypted = ""

xhr("/login/oauth.json", (d) ->
	window.token_encrypted = d)

window.getRepository = (err) ->
	github = new Github(
		token: decrypt(window.token_encrypted, localStorage.password, err)
		auth: "oauth"
	)

	github.getRepo("GrinnellSEA", "grinnellsea.github.io")


window.decrypt = (encrypted, password, err) ->
	if password
		try
			return sjcl.decrypt(password, encrypted)
		catch error
			err "Not authorized."
	else
		err "Not authorized"
	
	false
