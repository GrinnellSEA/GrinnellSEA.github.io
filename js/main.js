function main() {
	// set up event handlers
	els = $$(".mobile .dropdown h3");

	for (var i = 0; i < els.length; i++) {
		var el = els[i];
		el.onclick = toggleSubMenu.bind(null, el.innerHTML);
	}	

	// hide all submenus
	els = $$(".subdrop");
	for (var i = 0; i < els.length; i++) {
		els[i].style.display = "none";
	}
}

function toggleSubMenu(name) {
	// figure out if showing or hiding
	var show = false;
	var el = $(".subdrop#s_" + name.toLowerCase());
	if (el.style.display === "none") show = true;

	// hide all other submenus
	var menus = $$(".subdrop");

	for (var i = 0; i < menus.length; i++) {
		menus[i].style.display = "none";
	}

	if (show) el.style.display = "block";
}
