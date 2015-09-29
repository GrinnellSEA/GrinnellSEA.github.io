---
---

registered = []

window.main = () ->
	# sign in, etc.	
	checkPassword(localStorage.password || "")

	# set up event handlers
	for el in $$(".mobile .dropdown h3")
		el.onclick = toggleSubMenu.bind(null, el.innerHTML)

	# hide all submenus
	for el in $$(".subdrop")
		el.style.display = "none"

	# disable top level click on touchscreens
	if "ontouchstart" in document.documentElement
		for link in $$("nav .nav > a:not(.link)")
			link.style.pointerEvents = "none"

	# call registered functions
	for f in registered
		f()


toggleSubMenu = (name) ->
	# figure out if showing or hiding
	show = false
	el = $(".subdrop#s_" + name.toLowerCase())
	show = el.style.display == "none"

	# hide all other submenus
	for menu in $$(".subdrop")
			menu.style.display = "none"

	if show then el.style.display = "block"

checkPassword = (password) ->
	correct = "pGN3w+MArM2L4HQODi7aCrWef+L9a6O6WwulvY7B/1U="	
	sha = new jsSHA("SHA-256", "TEXT")
	sha.update(password)
	hash = sha.getHash("B64")
	if (hash == correct)
		login()
	else
		unlogin()

login = () ->
	el = $("#loginlink")	
	el.innerHTML = "Sign Out"
	el.href = ""
	el.onclick = () -> 
		localStorage.password = ""
		location.reload()
	
	for el in $$(".membersonly")
		el.style.display = "block"
	
unlogin = () ->
	for el in $$(".membersonly")
		el.remove()

window.registerFunction = (f) ->
	registered.push(f)
