---
---

registerFunction ->
	$("#submit").onclick = () ->
		github = new Github(
			token: "01eac6b82e5877e5e6b1c5a00616517536c8a7d9"
			auth: "oauth"
		)

		repo = github.getRepo("GrinnellSEA", "grinnellsea.github.io")

		title = $("#postTitle").value
		author = $("#postAuthor").value

		d = new Date()
		path = "_posts/" \
			+ d.getFullYear() + "-" \
			+ lpad(d.getMonth() + 1, 2) + "-" \
			+ lpad(d.getDate(), 2) + "-" \
			+ title.toLowerCase().replace(/\W/g, "").replace(/ /g, "-") \
			+ ".md"

		contents = """
			---
			title: #{title}
			author: #{author}
			---

			""" + $("#postText").value

		try
			repo.write("master", path, contents, "new blog post: #{title}", LOGF)
		catch error

		$("form").innerHTML = "Posted."


lpad = (value, padding) ->
	zeroes = "0"
	zeroes += "0" for i in [1..padding]
	(zeroes + value).slice(padding * -1)
