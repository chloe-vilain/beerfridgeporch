module BeercheckHelper
  include Chemistry


  def forecast_view_generator(forecast)
    forecast_view = Array.new
    forecast.each do |i|
      forecast_view << weather_view_generator(i)
    end
    return forecast_view
  end

  def weather_view_generator(weather)
    {
    tempurature: weather[:tempurature].round(1),
    timestamp: Time.at(weather[:timestamp]).to_datetime.to_formatted_s(:short),
    can_leave_out: Chemistry.can_leave_out(weather[:tempurature])
    }
  end








end
