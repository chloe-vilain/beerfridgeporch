class BeerchecksController < ApplicationController
  include Chemistry
  include BeercheckHelper

  def new
  end

  def show
    url_current = Owm_weather.build_weather_request(params[:post][:zip], params[:post][:country])
    url_forecast = Owm_weather.build_forecast_request_multiday(params[:post][:zip], params[:post][:country])
    weather = Owm_weather.get_forecast_data(url_current)
    forecast = Owm_weather.get_forecast_data(url_forecast)
    @weather_viewable = weather_view_generator(Owm_weather.parse_weather(weather), params[:post][:abv])
    @forecast_viewable = forecast_view_generator(Owm_weather.parse_forecast_multiday(forecast), params[:post][:abv])
    render 'show'
  end

end
