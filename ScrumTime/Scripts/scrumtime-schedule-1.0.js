function loadSchedule() {
    // Get

    $(function () {
        $.jqplot.config.enablePlugins = true;
        // sprint count == max sprint y-index
        // release min y-index == 0
        // release max y-index == sprint count || 3, whichever is greater
        // display range
        //      startDate:  mm/dd/yyyy
        //      endDate:    mm/dd/yyyy
        // display min 

        sprint3 = [['08/04/2010', 1, '08/04/2010'], ['09/15/2010', 1, '09/15/2010']];
        sprint2 = [['03/18/2010', 2, '03/18/2010'], ['08/01/2010', 2, '08/01/2010']];
        sprint1 = [['01/01/2010', 3, '01/01/2010'], ['03/15/2010', 3, '03/15/2010']];
        release1 = [['09/20/2010', 0, 'Release 0.6'], ['09/20/2010', 3, 'Release 0.6']];

        plot2 = $.jqplot('releaseSchedule', [sprint2, sprint1, sprint3, release1], {
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
                    ticks: ['Sprint 3', 'Sprint 2', 'Sprint Alpha']
                }
            },
            series: [
                        { lineWidth: 1, showMarker: false, label: 'Sprint Alpha' },
                        { lineWidth: 6, showMarker: false, label: 'Sprint 2' },
                        { lineWidth: 8, showMarker: false, label: 'Sprint 3' },
                        { lineWidth: 6, showMarker: false, label: 'Release 0.6', color: '#ff4444', showLabel: true },
                        { pointLabels: { labelsFromSeries: true, hideZeros: true} }
                    ]

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
            onClose: function (dateText, inst) { updateReleaseSchedule(); }
        });

        $("#fromDatePicker").datepicker("setDate", "09/02/2010");
        $("#toDatePicker").datepicker("setDate", "11/02/2010");

        $("#scheduleMenu").tabs();
        $("#scheduleMenu").tabs("option", "cache", false);
        $("#scheduleMenu").tabs("option", "ajaxOptions", { cache: false });
        $("#scheduleMenu").tabs('select', 0);
    });

}

function replotReleaseSchedule(plot) {
    var startDate = $("#fromDatePicker").datepicker("getDate");
    var endDate = $("#toDatePicker").datepicker("getDate");

    sprint3 = [['08/03/2010', 1, '08/03/2010'], ['09/15/2010', 1, '09/15/2010']];
    sprint2 = [['03/18/2010', 2, '03/18/2010'], ['08/01/2010', 2, '08/01/2010']];
    sprint1 = [['01/01/2010', 3, '01/01/2010'], ['03/15/2010', 3, '03/15/2010']];
    release1 = [['09/20/2010', 0, 'Release 0.6'], ['09/20/2010', 3, 'Release 0.6']];
    
    plot2 = $.jqplot('releaseSchedule', [sprint2, sprint1, sprint3, release1], {
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
                min: startDate,
                max: endDate,
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
                ticks: ['Sprint 3', 'Sprint 2', 'Sprint Alpha']
            }
        },
        series: [
                {
                    lineWidth: 3, showMarker: false, label: 'Sprint Beta'
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

    plot2.replot();
    plot2.draw();


}

function updateReleaseSchedule() {
    var startDate = $("#fromDatePicker").val();
    var endDate = $("#toDatePicker").val();
    $.ajaxSetup({
        cache: false
    });

    $.getJSON("/Schedule/UpdateCalendar",
        {
            startDateRange: startDate,
            endDateRange: endDate
        },
        function (json) {
            sprint3 = [['08/03/2010', 1, '08/03/2010'], ['09/15/2010', 1, '09/15/2010']];
            sprint2 = [['03/18/2010', 2, '03/18/2010'], ['08/01/2010', 2, '08/01/2010']];
            sprint1 = [['01/01/2010', 3, '01/01/2010'], ['03/15/2010', 3, '03/15/2010']];
            release1 = [['09/20/2010', 0, 'Release 0.6'], ['09/20/2010', 3, 'Release 0.6']];

            //[sprint2, sprint1, sprint3, release1]

            plot2 = $.jqplot('releaseSchedule', json.Data, {
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
                        tickInterval: json.XAxisTickIntervalDays + " days",
                        min: startDate,
                        max: endDate,
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
                        ticks: json.YAxisTicks
                    }
                },
                series: json.Series
                //                series: [
                //                {
                //                    lineWidth: 3, showMarker: false, label: 'Sprint Beta'
                //                }, {
                //                    lineWidth: 3, showMarker: false, label: 'Sprint 2'
                //                }, {
                //                    lineWidth: 3, showMarker: false, label: 'Sprint 3'
                //                }, {
                //                    lineWidth: 6, showMarker: false, label: 'Release 0.6', color: '#ff4444', showLabel: true
                //                }, {
                //                    pointLabels: { labelsFromSeries: true, hideZeros: true
                //                    }
                //                }]

                /*seriesDefaults: { fill: true, fillAndStroke: true, fillAlpha: 0.5, shadow: false }*/
            });

            plot2.replot();
            plot2.draw();
        });

    


}