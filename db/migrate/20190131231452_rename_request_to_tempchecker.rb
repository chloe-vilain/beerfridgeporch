class RenameRequestToTempchecker < ActiveRecord::Migration[5.2]
  def change
    rename_table :requests, :beerchecks
  end
end
