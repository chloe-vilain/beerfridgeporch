module Chemistry
  require 'logger'

#Helpful functions
  def self.convert_kelvin_to_celcius(kelvin)
    kelvin - 273.15
  end

  def self.convert_kelvin_to_farenheit(kelvin)
    convert_kelvin_to_celcius(kelvin) * 9 / 5 + 32
  end

#Core logic
  def self.can_leave_out(tempurature)
    Rails.logger.debug "The tempurature is #{tempurature}"
    if tempurature < 28
      "Don't put your beer outside! It may freeze."
    elsif tempurature < 38
      "It's colder than a fridge outside, but above freezing tempurature for beer"
    elsif tempurature < 50
      "It is the perfect tempurature outside to chill your beers!"
    else
      "It is too warm to leave your beer outside"
    end
  end

end
