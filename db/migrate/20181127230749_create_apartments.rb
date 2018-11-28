class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.string :building_manager
      t.string :manager_phone
      t.string :manager_hours

      t.timestamps
    end
  end
end
