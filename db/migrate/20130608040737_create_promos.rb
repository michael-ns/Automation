class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :redeem_page
      t.boolean :has_coupon
      t.string :coupon_code
      t.string :coupon_type
      t.string :coupon_discount_type
      t.float :coupon_discount_value
      t.boolean :has_gift_card
      t.string :gift_card_code
      t.float :gift_card_amount

      t.timestamps
    end
  end
end
