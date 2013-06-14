class AddPaymentToTestCases < ActiveRecord::Migration
  def change
  	add_column :test_cases, :payment_method, :string
  end
end
