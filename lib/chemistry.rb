module Chemistry
  require 'logger'
  include Math


  #Properties of different physical bottles
  #Surface area in m^3
  #heat transfer coefficiant W/m^2, assumes glass thickness = 1.58 mm, aluminium thickness .36mm
  #volume of beer, in m^3
  @Bottle_properties = { bottle_12oz: { surface_area: 0.032607, h_coeff: 9.783, volume: 0.000354882 },
                    can_12oz: { surface_area: 0.0311410, h_coeff: 9.557, volume: 0.000354882 },
                    can_160z: { surface_area: 0.0393092, h_coeff: 9.557, volume: 0.000473176 }
                  }

  #properties of beer/ ethanol
  @Density_beer = 1030 #kg/m^3 (density)
  @Cp_beer = 4065 #J/(kg*K) (mass specific heat capacity)

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


  def self.calculate_freezing_point_celcius(abv)
    0.00-(1.45*abv.to_f/(0.05*(100.00-abv.to_f)))
  end

  def self.calculate_beer_tempurature_over_time_vector(t_surrounding_array, t_start, bottle_type)
    bottle = @Bottle_properties[bottle_type]
    r_cooling = 1/(@Cp_beer/(bottle[:h_coeff]*bottle[:volume]*@Density_beer))
    beer_tempuratures = [t_start ]
    t_surrounding_array.each do |t_surrounding|
      beer_tempuratures << calculate_beer_tempurature_over_timestep(t_surrounding, beer_tempuratures.last, r_cooling)
    end
  end

  #Use Newton's Law of Cooling to calculate tempurature of beer assuming constant tempurature
  def self.calculate_beer_tempurature_over_timestep(t_surrounding, t_start, r_cooling)
    t_surrounding + (t_start - t_surrounding) * Math.exp(r_cooling)
  end

#Core logic
  def self.can_leave_out(tempurature_farenheit, abv)
    if tempurature_farenheit < calculate_freezing_point_celcius(abv)
      "Don't put your beer outside! It may freeze."
    elsif tempurature_farenheit < 5
      "It's colder than a fridge outside, but above freezing tempurature for beer"
    elsif tempurature_farenheit < 10
      "It is the perfect tempurature outside to chill your beers!"
    else
      "It is too warm to leave your beer outside"
    end
  end

end
