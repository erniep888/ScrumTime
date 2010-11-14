function loadSprintBurnDownChart(url) {
    
    // Get    
//    var testget = $.cookie('myCookie2');
//    if (testget.length > 0)
//        alert(testget);
//    else
//        $.cookie('myCookie2', 'bob');

    $.jqplot.config.enablePlugins = true;
    $.ajaxSetup({
        cache: false
    });

    $.getJSON(url,
        {
            username: 'bob'
        },
        function (json) {
            var sprintBurnDownPlot = $.jqplot('sprintBurnDownChart', json.Data, {
                title: {
                    text: 'Sprint Burn Down',
                    show: true
                },
                grid: {
                    drawGridlines: true,
                    gridLineColor: '#ddd',
                    background: '#fff',
                    shadowWidth: 5
                },
                axes: {
                    xaxis: {
                        renderer: $.jqplot.DateAxisRenderer,
                        tickInterval: "7 days",
                        min: json.XAxisMinDate,
                        max: json.XAxisMaxDate,
                        tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                        tickOptions: {
                            enableFontSupport: true,
                            angle: 40,
                            fontSize: '7pt',
                            formatString: '%m-%d-%y'
                        }
                    },
                    yaxis: {
                        min: json.YAxisMin
                    }
                },
                series: [
                        { lineWidth: 2, showMarker: false, color: '#aaa' },
                        { lineWidth: 3, showMarker: true, markerOptions: { style: 'square' }, color: '#90c233' }
                    ]
            });

            sprintBurnDownPlot.replot();
            sprintBurnDownPlot.draw();
        });

}


function loadTaskHoursPerSprint(username, url) {
    // Get

    $.jqplot.config.enablePlugins = true;
    $.ajaxSetup({
        cache: false
    });

    $.getJSON(url,
        {
            username: username
        },
        function (json) {
            var sprintBurnDownPlot = $.jqplot('taskHoursPerSprint', json.Data, {
                title: {
                    text: 'Task Hours Per Sprint',
                    show: true
                },
                seriesDefaults: {
                    renderer: $.jqplot.BarRenderer,
                    rendererOptions: { barDirection: 'vertical', barPadding: 6, barMargin: 15 }
                },
                grid: {
                    drawGridlines: true,
                    gridLineColor: '#ddd',
                    background: '#fff',
                    shadowWidth: 5
                },
                axes: {
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                        tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                        tickOptions: {
                            enableFontSupport: true,
                            angle: 40,
                            fontSize: '7pt'
                        },
                        ticks: json.Ticks
                    },
                    yaxis: {
                        min: json.YAxisMin,
                        max: json.YAxisMax
                    }
                }
            });

            sprintBurnDownPlot.replot();
            sprintBurnDownPlot.draw();
        });
}