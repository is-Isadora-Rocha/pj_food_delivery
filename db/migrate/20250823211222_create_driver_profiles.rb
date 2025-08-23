class CreateDriverProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :driver_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :vehicle_type
      t.string :plate
      t.boolean :active

      t.timestamps
    end
  end
end
