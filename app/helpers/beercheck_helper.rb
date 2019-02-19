module BeercheckHelper
  include Chemistry


  def forecast_view_generator(forecast, abv)
    forecast_view = Array.new
    tempurature_array = Array.new
    #beer_tempurature = Chemistry.calculate_beer_tempurature_over_time_vector(180, weather[:tempurature], 5, :bottle_12oz)
    forecast.each do |i|
      forecast_view << weather_view_generator(i, abv)
    end
    return forecast_view
  end

  def weather_view_generator(weather, abv)
    {
    tempurature: weather[:tempurature].round(1),
    timestamp: Time.at(weather[:timestamp]).to_datetime.to_formatted_s(:short),
    can_leave_out: Chemistry.can_leave_out(weather[:tempurature], abv)
    }
  end


end
