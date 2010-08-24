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
        var d = [[1196463600000, 2], [1198980000000, 2]];
        var d2 = [[1198980000000, 1], [1200550000000, 1]];

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

            markings.push({ color: '#d00', lineWidth: 3, xaxis: { from: 1198980000000, to: 1198980000000} });

            return markings;
        }

        var options = {
            xaxis: { mode: "time", min: 1196393600000, max: 1200630000000, timeformat: "%m/%d/%y", tickSize: [7, "day"] },
            yaxis: { min: 0, max: 3, ticks: [], autoscaleMargin: 0.1 },
            grid: { markings: weekendAreas, clickable: true, borderColor: "#999" },
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

        var plot = $.plot($("#releaseSchedule"), [{ label: "Release 0.6", data: d }, { label: "Release 0.9", data: d2}], options);

        //yaxis: { ticks: [], min: 0, autoscaleMargin: 0.1 },        
    });

}