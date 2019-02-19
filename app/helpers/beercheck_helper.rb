module BeercheckHelper
  include Chemistry


  def forecast_view_generator(forecast, abv, tempurature_array)
    forecast_view = Array.new
    i = forecast[0][:timestamp]/60 % 180
    Rails.logger.debug(tempurature_array.size)
    forecast.each do |data|
      forecast_view << weather_view_generator(data, abv, tempurature_array[i])
      i += 180
    end
    Rails.logger.debug(i)
    return forecast_view
  end

  def weather_view_generator(weather, abv, beer_temp)
    {
    tempurature: Chemistry.convert_celcius_to_farenheit(weather[:tempurature]).round(1),
    timestamp: Time.at(weather[:timestamp]).to_datetime.to_formatted_s(:short),
    can_leave_out: Chemistry.can_leave_out(weather[:tempurature], abv),
    beer_tempurature: Chemistry.convert_celcius_to_farenheit(beer_temp).round(1)
    }
  end


end
