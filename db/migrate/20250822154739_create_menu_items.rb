class CreateMenuItems < ActiveRecord::Migration[7.2]
  def change
    create_table :menu_items do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.boolean :available
      t.string :image_url

      t.timestamps
    end
  end
end
