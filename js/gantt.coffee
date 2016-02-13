---
---

window.drawChart = () ->
    Tabletop.init({
        key: "1vejpdG97f67MUdYa-FhJXUd24lPtTWKbBOzQV3XGAkQ"
        callback: onData
    })

onData = (spreadsheet) ->
    data = new google.visualization.DataTable()
    data.addColumn("string", "Task ID")
    data.addColumn("string", "Task Name")
    data.addColumn("string", "Resource")
    data.addColumn("date", "Start Date")
    data.addColumn("date", "End Date")
    data.addColumn("number", "Duration")
    data.addColumn("number", "Percent Complete")
    data.addColumn("string", "Dependencies")

    rows = []
    tasks = spreadsheet.tasks.elements

    for task in tasks
        rows.push([
            task.id.trim()
            task.description.trim()
            task.system.trim()
            if task.depends.trim() == "" then new Date("2/15/2016") else null
            null
            if task.days.trim() == "" then null else 864e5 * parseFloat(task.days)
            if task.complete.trim() == "" then null else parseFloat(task.complete)
            if task.depends.trim() == "" then null else task.depends.trim()
        ])

    data.addRows(rows)

    options =
        height: rows.length * 32 + 48
        backgroundColor:
            fill: "#fcfcfc"
        gantt:
            defaultStartDate: new Date("2/15/2016")
            criticalPathEnabled: true
            criticalPathStyle:
                strokeWidth: 3
            labelStyle:
                fontName: "Lato"
            shadowEnabled: false
            barHeight: 20
            trackHeight: 32
            barCornerRadius: 2


    chart = new google.visualization.Gantt($("#gantt"))
    chart.draw(data, options)
    google.visualization.events.addListener(chart, "error", console.log.bind(console))

google.charts.load("current", {packages: ["gantt"]})
google.charts.setOnLoadCallback(drawChart)
