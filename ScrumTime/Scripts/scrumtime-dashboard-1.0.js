function loadSprintBurnDownChart() {
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

        tasks = [['08/04/2010', 54, '08/04/2010'], ['08/05/2010', 50, '08/05/2010'],
            ['08/08/2010', 56, '08/08/2010'], ['08/12/2010', 48, '08/12/2010'], ['08/15/2010', 43, '08/15/2010']];
        idealTasks = [['08/04/2010', 54, '08/04/2010'], ['09/01/2010', 0, '09/01/2010']];

        $.jqplot('sprintBurnDownChart', [idealTasks, tasks], {
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
                    tickInterval: "7 days",
                    min: '08/04/2010',
                    max: '09/01/2010',
                    tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                    tickOptions: {
                        enableFontSupport: true,
                        angle: 30,
                        fontSize: '7pt',
                        formatString: '%m-%d-%y'
                    }
                },
                yaxis: {
                    min: 0,
                    max: 60
                }
            },
            series: [
                        { lineWidth: 2, showMarker: false, color: '#aaa' },
                        { lineWidth: 3, showMarker: true, markerOptions: { style: 'square' }, color: '#90c233' }
                    ]
    });



});

}

function loadTaskHoursPerSprint() {
    // Get

    $(function () {
        //$.jqplot.config.enablePlugins = true;
        // sprint count == max sprint y-index
        // release min y-index == 0
        // release max y-index == sprint count || 3, whichever is greater
        // display range
        //      startDate:  mm/dd/yyyy
        //      endDate:    mm/dd/yyyy
        // display min 

        //var taskHoursPerSprint = [[250, 1, 250], [54, 2], [35, 3], [10, 4], [0, 5], [0, 6]];
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
            //            axes: { xaxis: { min: 0 },
            //                yaxis: { 
            //                    renderer: $.jqplot.CategoryAxisRenderer,
            //                    ticks: ['Unscheduled', 'Sprint 1', 'Sprint Apple', 'Sprint Copperhead', 'Sprint 4', 'Sprint 5']
            //                } 
            //            }
            //            grid: {
            //                drawGridlines: true,
            //                gridLineColor: '#ddd',
            //                background: '#fff',
            //                shadowWidth: 5
            //            },
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
                    max: 350
                }
            }
        });



    });

}

function toggleTheSize() {   
    options = { to: { width: 200, height: 60 } };

// run the effect
    $("#testSize").effect('size', options, 500, null);


}

function callback() {
    setTimeout(function () {
        $("#testSize").removeAttr("style").hide().fadeIn();
    }, 1000);
};
