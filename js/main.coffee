---
---

window.main = () ->
	# set up event handlers
	for el in $$(".mobile .dropdown h3")
		el.onclick = toggleSubMenu.bind(null, el.innerHTML)

	# hide all submenus
	for el in $$(".subdrop")
		el.style.display = "none"

	if "ontouchstart" in document.documentElement
		for link in $$("nav .nav > a:not(.link)")
			link.style.pointerEvents = "none"


toggleSubMenu = (name) ->
	# figure out if showing or hiding
	show = false
	el = $(".subdrop#s_" + name.toLowerCase())
	show = el.style.display == "none"

	# hide all other submenus
	for menu in $$(".subdrop")
		menu.style.display = "none"

	if show then el.style.display = "block"
