class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :name
      t.integer :suite_id

      t.timestamps
    end
  end
end
