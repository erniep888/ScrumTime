function initializeRealeaseSchedule(updateCalendarUrl) {
    $("#toDatePicker").datepicker({
        onSelect: function (dateText, inst) { updateReleaseSchedule(updateCalendarUrl); },
        onClose: function (dateText, inst) { updateReleaseSchedule(updateCalendarUrl); },
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });
    $("#fromDatePicker").datepicker({
        onSelect: function (dateText, inst) { updateReleaseSchedule(updateCalendarUrl); },
        onClose: function (dateText, inst) { updateReleaseSchedule(updateCalendarUrl); },
        changeMonth: true,
        changeYear: true,
        gotoCurrent: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        yearRange: 'c-4:c+4'
    });

    $("#scheduleMenu").tabs();
    $("#scheduleMenu").tabs("option", "cache", false);
    $("#scheduleMenu").tabs("option", "ajaxOptions", { cache: false });
    $("#scheduleMenu").tabs('select', 0);
}

function updateReleaseSchedule(updateCalendarUrl) {
    $.jqplot.config.enablePlugins = true;
    var startDate = $("#fromDatePicker").val();
    var endDate = $("#toDatePicker").val();
    $.ajaxSetup({
        cache: false
    });

    $.getJSON(updateCalendarUrl,
        {
            startDateRange: startDate,
            endDateRange: endDate
        },
        function (json) {
            var plot = $.jqplot('releaseSchedule', json.Data, {
                grid: {
                    drawGridlines: true,
                    gridLineColor: '#ddd',
                    background: '#fff',
                    shadowWidth: 5
                },
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
            });

            plot.replot();
            plot.draw();
        });
}