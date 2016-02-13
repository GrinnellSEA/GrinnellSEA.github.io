---
---

window.drawChart = () ->
    data = new google.visualization.DataTable()
    data.addColumn("string", "Task ID")
    data.addColumn("string", "Task Name")
    data.addColumn("string", "Resource")
    data.addColumn("date", "Start Date")
    data.addColumn("date", "End Date")
    data.addColumn("number", "Duration")
    data.addColumn("number", "Percent Complete")
    data.addColumn("string", "Dependencies")

    raw = $("#gantt_data").innerText.trim().split("====\n")
    rows = (line.split("\n") for line in raw)
    for i in [0..rows.length-1]
        line = (item.trim() for item in rows[i])
        row = [
            line[0]
            line[1]
            line[2]
            if line[5] == "null" then new Date("2/15/2016") else null
            null
            if line[3] == "null" then null else 864e5 * parseFloat(line[3])
            if line[4] == "null" then null else parseFloat(line[4])
            if line[5] == "null" then null else line[5]
        ]
        rows[i] = row

    data.addRows(rows)

    options =
        height: 600
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

google.charts.load("current", {packages: ["gantt"]})
google.charts.setOnLoadCallback(drawChart)
