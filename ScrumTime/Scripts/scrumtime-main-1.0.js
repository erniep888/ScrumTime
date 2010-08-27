$(function () {
    $("#mainMenu").tabs();
    $("#mainMenu").tabs("option", "cache", false);
    $("#mainMenu").tabs("option", "ajaxOptions", { cache: false });
});

function loadBacklogTab() {
    $(function () {
        $("#mainMenu").tabs('select', 2);
    });
}


function loadSchedule() {
    $(function () {
        var d = [[1196980000000, 2], [1198980000000, 2]];
        var d2 = [[1199080000000, 1], [1200550000000, 1]];

        // first correct the timestamps - they are recorded as the daily
        // midnights in UTC+0100, but Flot always displays dates in UTC
        // so we have to add one hour to hit the midnights in the plot
        for (var i = 0; i < d.length; ++i)
            d[i][0] += 60 * 60 * 1000;

        // helper for returning the weekends in a period
        function weekendAreas(axes) {
            var markings = [];
            var d = new Date(axes.xaxis.min);
            // go to the first Saturday
            d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
            d.setUTCSeconds(0);
            d.setUTCMinutes(0);
            d.setUTCHours(0);
            var i = d.getTime();
            do {
                // when we don't set yaxis, the rectangle automatically
                // extends to infinity upwards and downwards
                markings.push({ xaxis: { from: i, to: i + 2 * 24 * 60 * 60 * 1000 }, color: "#ddd" });
                i += 7 * 24 * 60 * 60 * 1000;
            } while (i < axes.xaxis.max);

            markings.push({ color: '#d00', xaxis: { from: 1198968000000, to: 1198980000000} });


            return markings;
        }

        var options = {
            xaxis: { mode: "time", min: 1195980000000, max: 1205480000000, timeformat: "%m/%d/%y", tickSize: [7, "day"] },
            yaxis: { min: 0, max: 3, ticks: [], autoscaleMargin: 0.1 },
            grid: { markings: weekendAreas, clickable: true, borderColor: "#999", borderWidth: 1 },
            series: {
                lines: { show: true, lineWidth: 4 },
                points: { show: true },
                shadowSize: 1
            },
            legend: { show: true }
        };

        var releaseSchedule = $("#releaseSchedule");

        $("#releaseSchedule").bind("plotclick", function (event, pos, item) {
            if (item) {
                $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                plot.highlight(item.series, item.datapoint);
            }
        });

        var plot = $.plot($("#releaseSchedule"), [{ label: "Sprint Alpha", data: d }, { label: "Sprint Bistre", data: d2}], options);

        var offset = plot.pointOffset({ x: 1198980000000, y: 3 });
        releaseSchedule.append('<div style="position:absolute;left:' + (offset.left + 12) + 'px;top:' + (offset.top-1) + 'px;color:#d00;font-size:smaller">Release 0.6</div>');
        //        var offset = plot.pointOffset({ x: 1200980000000, y: 3 });
        //        releaseSchedule.append('<div style="position:absolute;left:' + (offset.left + 8) + 'px;top:' + offset.top + 'px;color:#d00;font-size:smaller">Release 0.7</div>');
        var ctx = plot.getCanvas().getContext("2d");
        ctx.beginPath();
        offset.left += 4;
        offset.top += 10;                          // move right by 4
        ctx.moveTo(offset.left, offset.top);            // start drawing
        ctx.lineTo(offset.left+5, offset.top-5);       // line from start to 10 above top
        ctx.lineTo(offset.left+5, offset.top+5);   // line to plus 5 right to 5 above top
        ctx.lineTo(offset.left, offset.top);            // line to start 
        ctx.fillStyle = "#d00";                         // fill in
        ctx.fill();


        //yaxis: { ticks: [], min: 0, autoscaleMargin: 0.1 },  

        //        $("#scheduleAccordion").accordion({  }); 

        $("#scheduleMenu").tabs();
        $("#scheduleMenu").tabs("option", "cache", false);
        $("#scheduleMenu").tabs("option", "ajaxOptions", { cache: false });
        $("#scheduleMenu").tabs('select', 0);
    });

}