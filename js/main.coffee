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
	xhr("/login/data.json", (data) -> 
		auth = getAuth(password, JSON.parse(data))
		if auth then login(auth) else unlogin
	)

window.getAuth = (password, PASSWORDS) ->
	sha = new jsSHA("SHA-256", "TEXT")
	sha.update(password)
	phash = sha.getHash("B64")

	for level, lhash of PASSWORDS
		if phash == lhash
			return "r_" + level
	
	# no matches
	return false

login = (auth) ->
	el = $("#loginlink")
	el.innerHTML = "Sign Out"
	el.href = ""
	el.onclick = () ->
		localStorage.password = ""
		location.reload()
	
	if auth == "backdoor" then auth = "admin"

	for el in $$(".restricted")
		if el.className.indexOf(auth) >= 0
			el.style.display = "block"
	
unlogin = () ->
	for el in $$(".restricted")
		el.remove()

window.registerFunction = (f) ->
	registered.push(f)
