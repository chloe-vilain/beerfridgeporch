class Owm_weather
  include Abstract_weather
  include Chemistry
  require 'net/http'
  require 'logger'

  def self.build_weather_request(zip, country)
    api_key = Rails.env.production? ? ENV["owm_key_prod"] : ENV["owm_key_dev"]
    "http://api.openweathermap.org/data/2.5/weather?zip=#{zip},#{country}&APPID=#{api_key}"
  end

  def self.build_forecast_request_multiday(zip, country)
    api_key = Rails.env.production? ? ENV["owm_key_prod"] : ENV["owm_key_dev"]
    "http://api.openweathermap.org/data/2.5/forecast?zip=#{zip},#{country}&APPID=#{api_key}"
  end

  def self.get_forecast_data(url)
    result = Net::HTTP.get(URI.parse(url))
  end

  def self.parse_weather(data)
    hash = JSON.parse data
    {timestamp: hash["dt"], tempurature: Chemistry.convert_kelvin_to_celcius(hash["main"]["temp"])}
  end

  def self.parse_forecast_multiday(data)
    hash = JSON.parse data
    forecast = Array.new
    hash["list"].each do |i|
      forecast << {timestamp: i["dt"], tempurature: Chemistry.convert_kelvin_to_celcius(i["main"]["temp"])}
    end
    return forecast
  end

  #Builds an array of outside tempuratures over time, assuming linear tempurature
  #change.
  #Takes timestep in seconds, defaults to one minute intervals
  def self.build_tempurature_by_timestep_array(weather, forecast, timestep = 60)
    time_0 = weather[:timestamp]
    tempurature_0 = weather[:tempurature]
    tempuratures = [ tempurature_0 ]
    forecast.each do |i|
      time_difference = ((i[:timestamp]-time_0)/timestep).ceil #time difference in minutes
      tempurature_difference = (i[:tempurature] - tempurature_0)
      time_0 = i[:timestamp]
      (1..time_difference).each do |i|
        tempuratures << tempurature_0 + (tempurature_difference/time_difference) * i
      end
      tempurature_0 = tempuratures.last
    end
    return tempuratures
  end


end
