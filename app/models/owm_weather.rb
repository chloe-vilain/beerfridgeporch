class Owm_weather
  include Abstract_weather
  include Chemistry
  require 'net/http'
  require 'logger'

  #soft-deprecated in favor of multiday requester
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

  #soft-deprecated in favor of multiday parser
  def self.parse_weather(data)
    hash = JSON.parse data
    Chemistry.convert_kelvin_to_farenheit(hash["main"]["temp"])
  end

  def self.parse_forecast_multiday(data)
    hash = JSON.parse data
    forecast = Array.new
    hash["list"].each do |i|
      forecast << Chemistry.convert_kelvin_to_farenheit(i["main"]["temp"])
    end
    return forecast
  end

end
