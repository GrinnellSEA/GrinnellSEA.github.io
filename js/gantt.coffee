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

    defaultStartDate = new Date("9/17/2016")

    for task in tasks
        rows.push([
            task.id
            task.description
            task.system
            if task.start == "" then (if task.depends == "" then defaultStartDate else null) else new Date(task.start)
            null
            if task.days == "" then null else 864e5 * parseFloat(task.days)
            if task.complete == "" then 0 else parseFloat(task.complete)
            if task.depends == "" then null else task.depends
        ])

    data.addRows(rows)

    options =
        height: rows.length * 32 + 48
        backgroundColor:
            fill: "#fcfcfc"
        gantt:
            defaultStartDate: defaultStartDate
            criticalPathEnabled: true
            criticalPathStyle:
                strokeWidth: 3
            labelStyle:
                fontName: "Lato"
                fontWeight: 400
            shadowEnabled: false
            barHeight: 20
            trackHeight: 32
            barCornerRadius: 2


    chart = new google.visualization.Gantt($("#gantt"))
    chart.draw(data, options)
    google.visualization.events.addListener(chart, "error", console.log.bind(console))

google.charts.load("current", {packages: ["gantt"]})
google.charts.setOnLoadCallback(drawChart)
