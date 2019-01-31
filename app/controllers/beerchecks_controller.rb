class BeerchecksController < ApplicationController

  def new
    @beercheck = Beercheck.new
  end

  def create
    @beercheck = Beercheck.new(beercheck_params)
    if @beercheck.save
      redirect_to @beercheck
    else
      render 'new'
    end
  end

  def show
    @beercheck = Beercheck.find(params[:id])
  end


  private

    def beercheck_params
      params.require(:beercheck).permit(:tempurature, :is_farenheit, :abv)
    end

end
