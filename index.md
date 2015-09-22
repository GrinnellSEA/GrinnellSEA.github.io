---
---

# The Grinnell Space Exploration Agency

<div id="news">

	<div class="item">
		<img alt="Near Space" src="https://upload.wikimedia.org/wikipedia/commons/8/83/Picture_taken_at_aprox._100,000_feet_above_Oregon_by_Justin_Hamel_and_Chris_Thompson.jpg">
		<a class="text" href="/missions/nearspaceballoon.html">Near-Space Balloon Project</a>
	</div>

	<div class="item item-text">
		<h3>GSEA Blog Posts</h3>
		{% for post in site.posts limit: 10 %}
		<a href="{{ post.url }}">{{ post.title }}</a><br />
		{% endfor %}
	</div>

	<div class="item">
		<img alt="Grinnell College"
		src="https://www.grinnell.edu/sites/default/files/styles/front_page_slideshow/public/About%20campus%20shot.jpg?itok=nhtt1ZAs">
		<a class="text" href="/about">GSEA Launches!</a>
	</div>

</div>
