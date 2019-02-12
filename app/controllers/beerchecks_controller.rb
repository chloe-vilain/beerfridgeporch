class BeerchecksController < ApplicationController
  include Chemistry

  def new
  end

  def show
    url = Owm_weather.build_forecast_request_multiday(params[:post][:zip], params[:post][:country])
    forecast = Owm_weather.get_forecast_data(url)
    @tempurature_forecast = Owm_weather.parse_forecast_multiday(forecast)
    @can_leave_out = Chemistry.can_leave_out(@tempurature_forecast[0])
    render 'show'
  end

end
