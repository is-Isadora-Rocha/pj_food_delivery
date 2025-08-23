class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 10, scale: 2
      t.string :notes

      t.timestamps
    end
  end
end
