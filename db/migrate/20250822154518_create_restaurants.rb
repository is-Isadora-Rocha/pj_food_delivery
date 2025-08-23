class CreateRestaurants < ActiveRecord::Migration[7.2]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :phone
      t.boolean :active
      t.time :opening_time
      t.time :closing_time
      t.decimal :min_order_value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
