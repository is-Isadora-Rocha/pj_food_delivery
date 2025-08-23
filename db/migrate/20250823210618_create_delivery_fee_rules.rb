class CreateDeliveryFeeRules < ActiveRecord::Migration[7.2]
  def change
    create_table :delivery_fee_rules do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.decimal :min_km, precision: 5, scale: 2
      t.decimal :max_km, precision: 5, scale: 2
      t.decimal :fee, precision: 10, scale: 2

      t.timestamps
    end
  end
end
