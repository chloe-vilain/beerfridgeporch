module Chemistry

  def self.convert_kelvin_to_celcius(kelvin)
    kelvin - 273.15
  end

  def self.convert_kelvin_to_farenheit(kelvin)
    convert_kelvin_to_celcius(kelvin) * 9 / 5 + 32
  end

end
