function main() {
	els = $$(".mobile .dropdown h3");

	for (var i = 0; i < els.length; i++) {
		var el = els[i];
		el.onclick = openSubMenu.bind(null, el.innerHTML);
	}	
}

function openSubMenu(name) {
	// hide all other submenus
	var menus = $$(".subdrop");

	for (var i = 0; i < menus.length; i++) {
		var menu = menus[i];
		menu.style.display = "none";
	}

	// show correct menu
	$(".subdrop#s_" + name.toLowerCase()).style.display = "block";
}
