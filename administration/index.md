---
title: GSEA Administration
---

<div class="restricted r_member r_admin" markdown="1">

## Member Announcements

### Interest Survey
New members---please fill out [this interest survey](https://docs.google.com/forms/d/1hbgW_l3n2HQUzWB5rlXyv5gJFXY0-ZD7rmXqbbgr6tU/viewform).

</div>
<div class="restricted r_guest r_member r_admin" markdown="1">

## Engineering Process

### Forms and Documents

<div class="restricted r_member r_admin" markdown="1">

[Review Request](https://docs.google.com/forms/d/1yAU-LYgOhWULHwe9Ejq0_dmjwOMEtClFsM5wlTzklH8/viewform?entry.1003946160&entry.548196545&entry.440845126=2)

[Parts Order](https://docs.google.com/forms/d/1hhSpG48cjOC3B4VpkQMxftGJdfarbLL_ZKpN8BTPjto/viewform)

</div>

[System Progress Tracking](https://docs.google.com/document/d/1BPysrvO8gSOnd8NBbkP2i5snh8qwPDoDyeyJ6W0BSR4/edit?usp=sharing)

### Resources

[NASA Systems Engineering Handbook](http://www.acq.osd.mil/se/docs/NASA-SP-2007-6105-Rev-1-Final-31Dec2007.pdf)

<div class="restricted r_admin" markdown="1">

## Administration

### Generate Password Hashes

<input type="text" placeholder="Password" id="pass" /> 
<button id="generate">Generate</button> <br />
<span id="output"></span>

<script type="text/javascript">
	registerFunction(function() {
		$("button#generate").onclick = function() {
			var pass = $("#pass").value;
			var sha = new jsSHA("SHA-256", "TEXT");
			sha.update(pass);
			$("#output").innerHTML = sha.getHash("B64");
		};
	});
</script>

### [Personnel Data](https://goo.gl/CJHUNI)

</div>
</div>


## Mission Budgets

[Near-Space Balloon Project Budget](/assets/balloon-budget.pdf)
