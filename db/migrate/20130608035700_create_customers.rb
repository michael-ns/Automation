class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :type

      t.timestamps
    end
  end
end
