class BeerchecksController < ApplicationController
  include Chemistry

  def new
  end

  def show
    url = Owm_weather.build_weather_request(params[:post][:zip], params[:post][:country])
    weather = Owm_weather.get_weather_data(url)
    @tempurature = Owm_weather.parse_weather(weather)
    @can_leave_out = Chemistry.can_leave_out(@tempurature)
    render 'show'
  end


end
