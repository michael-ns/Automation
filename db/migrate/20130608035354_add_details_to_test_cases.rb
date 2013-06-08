class AddDetailsToTestCases < ActiveRecord::Migration
  def change
    add_column :test_cases, :customer_id, :integer
    add_column :test_cases, :promo_id, :integer
  end
end
