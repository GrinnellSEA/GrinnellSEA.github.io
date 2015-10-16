---
---

# run if fully authorized
auth = () ->
	repo = getRepository((err) ->
		$("form").innerHTML = err
	)

	title = $("#postTitle").value
	author = $("#postAuthor").value

	d = new Date()
	path = "_posts/" \
		+ d.getFullYear() + "-" \
		+ lpad(d.getMonth() + 1, 2) + "-" \
		+ lpad(d.getDate(), 2) + "-" \
		+ title.toLowerCase().replace(/ /g, "-").replace(/\W/g, "") \
		+ ".md"

	contents = """
		---
		title: #{title}
		author: #{author}
		---

		""" + $("#postText").value

	try
		repo.write("master", path, contents, \
			"New blog post \"#{title}\" by #{author} [ci skip]", LOGF)
	catch error

	$("form").innerHTML = "Posted."

	false


registerFunction ->
	$("#submit").onclick = auth


lpad = (value, padding) ->
	zeroes = "0"
	zeroes += "0" for i in [1..padding]
	(zeroes + value).slice(padding * -1)
