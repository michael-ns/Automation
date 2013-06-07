class TestSuite < ActiveRecord::Base
	belongs_to :feature
	has_many :testCases
end
