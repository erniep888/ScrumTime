function loadSprintBurnDownChart() {

    
    // Get    
//    var testget = $.cookie('myCookie2');
//    if (testget.length > 0)
//        alert(testget);
//    else
//        $.cookie('myCookie2', 'bob');

    $.ajaxSetup({
        cache: false
    });

    $.getJSON("/Dashboard/UpdateSprintBurnDown",
        {
            
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
                            angle: 30,
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


function loadTaskHoursPerSprint() {
    // Get

    $(function () {
        var taskHoursPerSprint = [[1, 250, 'Unscheduled'], [2, 54, 'Sprint 1'], [3, 20, 'Sprint Banana'], [4, 0, 'Sprint Cross Reference'], [5, 8, 'Sprint Sammy']];

        $.jqplot('taskHoursPerSprint', [taskHoursPerSprint], {
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
                    ticks: [' ', ' ', ' ', ' ', ' ']
                },
                yaxis: {
                    min: 0,
                    max: 330
                }
            }
        });
    });

}