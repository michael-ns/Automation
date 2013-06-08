class AddAddressMailcallToTestCases < ActiveRecord::Migration
  def change
    add_column :test_cases, :address_id, :integer
    add_column :test_cases, :mailcall, :boolean
  end
end
