class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
