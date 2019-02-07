class AddCountryToBeercheck < ActiveRecord::Migration[5.2]
  def change
    add_column :beerchecks, :country, :string
    add_column :beerchecks, :zip, :string
  end
end
