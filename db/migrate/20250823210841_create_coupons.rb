class CreateCoupons < ActiveRecord::Migration[7.2]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_type
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :min_order_value, precision: 10, scale: 2
      t.references :restaurant, null: false, foreign_key: true
      t.datetime :expires_at
      t.boolean :active, default: true
      t.integer :usage_limit

      t.timestamps
    end
  end
end
