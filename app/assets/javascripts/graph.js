var graph = function (user, questions, answers, comments) { 
    $('#container').highcharts({
        chart: {
            type: 'column',
        },
        title: {
            text: 'Your Activity'
        },
        xAxis: {
            categories: ['Questions', 'Answers', 'Comments']
        },
        yAxis: {
            min: 0,
            tickInterval: 1,
            title: {
                text: null
            },
        },
        series: [{
            threshold: 0,
            negativeColor: 'red',
            color: '#AAE6F6',
            showInLegend: false,
            name: user,
            data: [questions, answers, comments]
        }]
    });
};