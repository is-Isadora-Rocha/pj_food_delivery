class CreateCouponRedemptions < ActiveRecord::Migration[7.2]
  def change
    create_table :coupon_redemptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :coupon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
