class DropApartments < ActiveRecord::Migration[5.2]
  def change
    drop_table :apartments
  end
end
