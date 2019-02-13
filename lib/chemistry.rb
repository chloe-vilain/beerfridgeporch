module Chemistry
  require 'logger'

#Helpful functions
  def self.convert_kelvin_to_celcius(kelvin)
    kelvin - 273.15
  end

  def self.convert_kelvin_to_farenheit(kelvin)
    convert_kelvin_to_celcius(kelvin) * 9 / 5 + 32
  end

  def self.convert_celcius_to_farenheit(celcius)
    9/5*celcius+32
  end

#Core logic
  def self.can_leave_out(tempurature_farenheit, abv)
    if tempurature_farenheit < convert_celcius_to_farenheit(calculate_freezing_point_celcius(abv))
      "Don't put your beer outside! It may freeze."
    elsif tempurature_farenheit < 38
      "It's colder than a fridge outside, but above freezing tempurature for beer"
    elsif tempurature_farenheit < 50
      "It is the perfect tempurature outside to chill your beers!"
    else
      "It is too warm to leave your beer outside"
    end
  end

  def self.calculate_freezing_point_celcius(abv)
    0.00-(1.45*abv.to_f/(0.05*(100.00-abv.to_f)))
  end

end
