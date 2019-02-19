class BeerchecksController < ApplicationController
  include Chemistry
  include BeercheckHelper

  def new
  end

  def show
    url_current = Owm_weather.build_weather_request(params[:post][:zip], params[:post][:country])
    url_forecast = Owm_weather.build_forecast_request_multiday(params[:post][:zip], params[:post][:country])
    weather = Owm_weather.parse_weather(Owm_weather.get_forecast_data(url_current))
    forecast = Owm_weather.parse_forecast_multiday(Owm_weather.get_forecast_data(url_forecast))
    tempurature_array = Owm_weather.build_tempurature_by_timestep_array(weather, forecast)
    beer_tempurature = Chemistry.calculate_beer_tempurature_over_time_vector(tempurature_array, 5, :bottle_12oz)
    #logger.debug(tempurature_array)
    @weather_viewable = weather_view_generator(weather, params[:post][:abv], beer_tempurature[0])
    @forecast_viewable = forecast_view_generator(forecast, params[:post][:abv], beer_tempurature)
    render 'show'
  end

end
