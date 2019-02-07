module Abstract_weather

  #Builds the API request from user input ZIP and country
  #Takes zip (string), country (string)
  #Returns url (string)
  def build_weather_request(zip, country)
    raise NotImplementedError, "Function not implemented"
  end

  #Fetches weather data from external API
  #Takes url (string)
  #Returns weather_data (JSON blob)
  def get_weather_data(url)
    raise NotImplementedError, "Function not implemented"
  end

  #Parses weather data to format usable by app
  #Takes weather_data (JSON blob)
  #Returns parsed_weather_data (hash map)
  def parse_weather(weather_data)
    raise NotImplementedError, "Function not implemented"
  end

end
