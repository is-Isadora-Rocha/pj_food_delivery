class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.integer :status
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :delivery_fee, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.integer :payment_method
      t.integer :payment_status
      t.bigint :courier_id
      t.integer :distance_meters
      t.integer :eta_minutes
      t.text :route_geometry
      #t.references :coupon, null: false, foreign_key: true
      t.references :coupon


      t.timestamps
    end
  end
end
