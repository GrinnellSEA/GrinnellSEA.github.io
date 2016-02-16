---
title: GSEA
layout: main
---

# The Grinnell Space Exploration Agency

<div id="news">

	<div class="item" flex2>
		<img alt="Gravitational Waves" class="home" src="http://www.popsci.com/sites/popsci.com/files/styles/medium_1x_/public/figure2.jpg?itok=SANNarB5">
		<a class="text" href="/2016/02/12/ligo-finds-gravitational-waves.html">LIGO Finds Gravitational Waves</a>
	</div>

	<div class="item item-text">
		<h3>Recent Blog Posts</h3>
		{% for post in site.posts limit: 5 %}
			<a href="{{ post.url }}">{{ post.title }}</a><br />
		{% endfor %}
		<a href="/blog" class="more">All posts&hellip;</a>
	</div>

	<div class="item" style="width: 400px;">
		<img alt="Banner" class="home" src="/assets/banner-notext.svg"
		style="height: 100%;">
		<a class="text" href="/2015/10/06/meeting-schedule.html">Joining</a>
	</div>

	<div class="item">
		<img alt="Near Space" class="home" lazyload src="https://upload.wikimedia.org/wikipedia/commons/8/83/Picture_taken_at_aprox._100,000_feet_above_Oregon_by_Justin_Hamel_and_Chris_Thompson.jpg">
		<a class="text" href="/missions/nearspaceballoon">
		Transcendence Near-Space Balloon</a>
	</div>

	<div class="item">
		<img alt="Arduino board" class="home"
		src="/assets/newsreel/arduino.jpeg">
		<a class="text" href="/2015/10/26/first-parts-arrive.html">Parts
		Arrive</a>
	</div>

	<div class="item">
		<img alt="Grinnell College" class="home"
		src="/assets/newsreel/gates_tower.jpg" lazyload>
		<a class="text" href="/2015/09/22/gsea-launches.html">GSEA Launches!</a>
	</div>

</div>
