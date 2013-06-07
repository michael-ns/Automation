class TestCaseController < ApplicationController
	def load
		@suite = TestSuite.find(params[:id])
		@testCases = TestCase.find(:all, :conditions => ['suite_id = ?', @suite.id])
		render :json => @testCases
	end
end
