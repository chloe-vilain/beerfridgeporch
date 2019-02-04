class Beercheck < ApplicationRecord


  def convert_to_farenheit
    self.is_farenheit ? self.tempurature : self.tempurature * 9 / 5 + 32
  end

  def can_leave_out
    convert_to_farenheit > 28.0 ? true : false
  end

end
