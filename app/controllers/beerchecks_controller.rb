class BeerchecksController < ApplicationController


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
    @url = Owm_weather.build_weather_request("02134", "us")
    @weather = Owm_weather.get_weather_data(@url)
    @weather_hash = Owm_weather.parse_weather(@weather)
  end


  private

    def beercheck_params
      params.require(:beercheck).permit(:tempurature, :is_farenheit, :abv)
    end

end
