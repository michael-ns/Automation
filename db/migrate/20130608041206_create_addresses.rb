class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :billing_country
      t.string :billing_address
      t.string :billing_suburb
      t.boolean :shipping_same_as_billing
      t.string :shipping_country
      t.string :shipping_address
      t.string :shipping_suburb

      t.timestamps
    end
  end
end
