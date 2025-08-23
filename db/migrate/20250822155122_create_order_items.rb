class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.decimal :total_price, precision: 10, scale: 2
      t.string :notes

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :courier_id
    add_index :orders, :courier_id
  end
end
