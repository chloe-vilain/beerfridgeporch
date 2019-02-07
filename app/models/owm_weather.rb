class Owm_weather
  include Abstract_weather
  include Chemistry
  require 'net/http'

  def self.build_weather_request(zip, country)
    api_key = Rails.env.production? ? ENV["owm_key_prod"] : ENV["owm_key_dev"]
    "http://api.openweathermap.org/data/2.5/weather?zip=#{zip},#{country}&APPID=#{api_key}"
  end

  def self.get_weather_data(url)
    result = Net::HTTP.get(URI.parse(url))
  end

  def self.parse_weather(data)
    hash = JSON.parse data
    Chemistry.convert_kelvin_to_farenheit(hash["main"]["temp"])
  end

end
