class CreatePaymentIntents < ActiveRecord::Migration[7.2]
  def change
    create_table :payment_intents do |t|
      t.references :order, null: false, foreign_key: true
      t.string :provider
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status
      t.string :external_id
      t.json :payload

      t.timestamps
    end
  end
end
