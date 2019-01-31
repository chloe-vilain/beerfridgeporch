class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.float :tempurature
      t.boolean :is_farenheit
      t.float :abv

      t.timestamps
    end
  end
end
