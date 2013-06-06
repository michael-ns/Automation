class TestSuiteController < ApplicationController
	def load
		@feature = Feature.find(params[:id])
		@testSuites = TestSuite.find(:all, :conditions => ['feature_id = ?', @feature.id])
		render :json => @testSuites
	end

	def create
		@suite = TestSuite.new(suite_params)

		respond_to do |format|
	      if @suite.save
	        format.html { redirect_to root_path, notice: 'Test Suite was successfully created.' }
	        format.json { render json: @suite, status: :created, location: @suite }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @suite.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	    def set_suite
	      @suite = TestSuite.find(params[:id])
	    end

		def suite_params
	      params.require(:test_suite).permit(:name)
	    end
end
