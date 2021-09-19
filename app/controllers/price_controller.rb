class PriceController < ApplicationController
  before_action :set_dary, only: [:get_quote_of, :get_quote_last_seven_days]

  def index
    @text = "Texto de teste"
  end

  def get_quote_of
    api = Quote::Api.new
    response = api.quote_of(params[:currencies])
    render json: { data: response }, status: :ok
  end

  def get_quote_last_seven_days
    api = Quote::Api.new
    response = api.quote_last_seven_days(params.values)
    quote_last_seven_days = {name: "Teste", data: [0.1, 3.2, 23.4, 2.2]}
    opts = {
      chart: {defaultSeriesType: 'line'},
      title: {
        text: 'Solar Employment Growth by Sector, 2010-2016'
        },

      subtitle: {
          text: 'Source: thesolarfoundation.com'
      },

      yAxis: {
          title: {
              text: 'Number of Employees'
          }
      },
      legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle'
      },

      plotOptions: {
          # this is not working. Find the bug
          # series: {
          #     pointStart: 43934
          # }
      },
  }

# data for the charts
    series_dt = ([
      quote_last_seven_days,
      {
      name: 'Tokyo',
      data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    }, {
      name: 'London',
      data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
    }])
    @line_chart = Daru::View::Plot.new(
      series_dt, opts
    )
    render :index, status: :ok
  end

  private

  def set_dary
    Daru::View.plotting_library = :highcharts
  end

end
