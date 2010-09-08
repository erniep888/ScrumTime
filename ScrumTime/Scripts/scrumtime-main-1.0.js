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
        sprint3 = [['08/04/2010', 1, '08/04/2010'], ['09/15/2010', 1, '09/15/2010']];
        sprint2 = [['03/18/2010', 2, '03/18/2010'], ['08/01/2010', 2, '08/01/2010']];
        sprint1 = [['01/01/2010', 3, '01/01/2010'], ['03/15/2010', 3, '03/15/2010']];
        release1 = [['09/20/2010', 0, 'Release 0.6'], ['09/20/2010', 3, 'Release 0.6']];

        plot2 = $.jqplot('releaseSchedule', [sprint3, sprint2, sprint1, release1], {
            //            legend: {
            //                renderer: $.jqplot.EnhancedLegendRenderer,
            //                show: true, location: 'nw',
            //                rendererOptions:{
            //                    numberRows: 1
            //                },
            //            },
            //            title: 'A Horizontal Line',
            axes: {
                xaxis: {
                    renderer: $.jqplot.DateAxisRenderer,
                    tickInterval: "14 days",
                    min: '12/20/2009',
                    tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                    tickOptions: {
                        enableFontSupport: true,
                        angle: 30,
                        fontSize: '7pt',
                        formatString: '%m-%d-%y'
                    }
                },
                yaxis: {
                    renderer: $.jqplot.CategoryAxisRenderer,
                    ticks: ['Sprint 3', 'Sprint 2', 'Sprint 1']
                }
            },
            series: [
                {
                    lineWidth: 3, showMarker: false, label: 'Sprint 1'
                }, {
                    lineWidth: 3, showMarker: false, label: 'Sprint 2'
                }, {
                    lineWidth: 3, showMarker: false, label: 'Sprint 3'
                }, {
                    lineWidth: 6, showMarker: false, label: 'Release 0.6', color: '#ff4444', showLabel: true
                }, {
                    pointLabels: { labelsFromSeries: true, hideZeros: true
                    }
                }]

            /*seriesDefaults: { fill: true, fillAndStroke: true, fillAlpha: 0.5, shadow: false }*/
        });

        $("#fromDatePicker").datepicker({
            onSelect: function (dateText, inst) {
                plot2.axes.xaxis.min = dateText;
                plot2.replot();
                plot2.draw();
            },
            onClose: function (dateText, inst) { },
            changeMonth: true,
            changeYear: true,
            gotoCurrent: true,
            showOtherMonths: true,
            selectOtherMonths: true,
            yearRange:'c-4:c+4'
        });

        $("#toDatePicker").datepicker({
            defaultDate: +30,
            onClose: function (dateText, inst) { alert($("#fromDatePicker").datepicker("getDate")); }
        });

        $("#fromDatePicker").datepicker("setDate", "09/02/2010");
        $("#toDatePicker").datepicker("setDate", "11/02/2010");

        $("#scheduleMenu").tabs();
        $("#scheduleMenu").tabs("option", "cache", false);
        $("#scheduleMenu").tabs("option", "ajaxOptions", { cache: false });
        $("#scheduleMenu").tabs('select', 0);
    });

}