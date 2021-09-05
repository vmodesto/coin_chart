Highcharts.chart('container', {

  title: {
      text: 'Cotação dos últimos sete dias para real versus dólar, 2021'
  },

  subtitle: {
      text: 'Fonte: hgbrasil.com'
  },

  yAxis: {
      title: {
          text: 'Number of Employees'
      }
  },

  xAxis: {
      accessibility: {
          rangeDescription: 'Range: 2010 to 2017'
      }
  },

  legend: {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle'
  },

  plotOptions: {
      series: {
          label: {
              connectorAllowed: false
          },
          pointStart: 2010
      }
  },

  series: [{
      name: 'Installation',
      data: [43934, 52503, 57177, 69658, 97031, 119931, 137133]
  }, {
      name: 'Manufacturing',
      data: [24916, 24064, 29742, 29851, 32490, 30282, 38121]
  },{
    name: 'Teste',
    data: [28916, 30064, 29742, 29851, 32490, 30282, 100121]
}
],

  responsive: {
      rules: [{
          condition: {
              maxWidth: 500
          },
          chartOptions: {
              legend: {
                  layout: 'horizontal',
                  align: 'center',
                  verticalAlign: 'bottom'
              }
          }
      }]
  }

});