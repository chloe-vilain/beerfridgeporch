class BeerchecksController < ApplicationController
  include Chemistry

  def new
    @beercheck = Beercheck.new
  end

  def create
    a = beercheck_params
    @beercheck = Beercheck.new(a)
    if @beercheck.save
      redirect_to @beercheck
    else
      render 'new'
    end
  end

  def show
    @beercheck = Beercheck.find(params[:id])
    url = Owm_weather.build_weather_request(@beercheck.zip, @beercheck.country)
    weather = Owm_weather.get_weather_data(url)
    @tempurature = Owm_weather.parse_weather(weather)
    @can_leave_out = Chemistry.can_leave_out(@tempurature)
  end


  private

    def beercheck_params
      params.require(:beercheck).permit(:country, :zip, :abv)
    end

end
