class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :url
      t.integer :quantity
      t.boolean :gift_wrap
      t.boolean :is_cpr
      t.string :type
      t.string :size

      t.timestamps
    end
  end
end
