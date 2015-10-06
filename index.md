---
title: GSEA
---

## The Grinnell Space Exploration Agency

<div id="news">

	<div class="item">
		<img alt="Banner" class="home" src="/assets/banner-notext.svg" style="height: 100%">
		<a class="text" href="/2015/10/06/meeting-schedule.html">GSEA Meetings</a>
	</div>

	<div class="item">
		<img alt="Martian Water" class="home" src="http://i.space.com/images/i/000/011/377/i02/mars-water-signs-newton-crater-gullies-110804.jpg?1312483871">
		<a class="text" href="/2015/09/29/water-mars.html">NASA Finds Liquid Water on Mars</a>
	</div>
	
	<div class="item item-text">
		<h3>Recent Blog Posts</h3>
		{% for post in site.posts limit: 5 %}
			<a href="{{ post.url }}">{{ post.title }}</a><br />
		{% endfor %}
		<a href="/blog" class="more">All posts&hellip;</a>
	</div>

	<div class="item">
		<img alt="Near Space" class="home"  src="https://upload.wikimedia.org/wikipedia/commons/8/83/Picture_taken_at_aprox._100,000_feet_above_Oregon_by_Justin_Hamel_and_Chris_Thompson.jpg">
		<a class="text" href="/missions/nearspaceballoon.html">Near-Space Balloon Project</a>
	</div>

	<div class="item">
		<img alt="Grinnell College" class="home"
		src="/assets/newsreel/gates_tower.jpg">
		<a class="text" href="/2015/09/22/gsea-launches.html">GSEA Launches!</a>
	</div>

</div>
