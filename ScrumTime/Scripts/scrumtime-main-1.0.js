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
        $.jqplot.config.enablePlugins = true;
        line1 = [[4, 1], [2, 2], [9, 3], [16, 4]];
        line2 = [[3, 1], [7, 2], [6.25, 3], [3.125, 4]];
        plot2 = $.jqplot('releaseSchedule', [line1, line2], {
            stackSeries: true,
            legend: {
                show: true,
                location: 'se'
            },
            title: 'Unit Sales: Acme Decoy Division',
            seriesDefaults: {
                renderer: $.jqplot.BarRenderer,
                rendererOptions: {
                    barDirection: 'horizontal',
                    barPadding: 6,
                    barMargin: 40
                }
            },
            series: [{
                label: '1st Qtr'
            },
        {
            label: '2nd Qtr'
        }],
            axes: {
                yaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ['Q1', 'Q2', 'Q3', 'Q4']
                },
                xaxis: { min: 0, max: 20, numberTicks: 5 }
            }
        });


        $("#scheduleMenu").tabs();
        $("#scheduleMenu").tabs("option", "cache", false);
        $("#scheduleMenu").tabs("option", "ajaxOptions", { cache: false });
        $("#scheduleMenu").tabs('select', 0);
    });

}