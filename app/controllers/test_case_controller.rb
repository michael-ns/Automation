class TestCaseController < ApplicationController

	def new
		@testCase = TestCase.new
		@parentSuite = TestSuite.find(params[:suite_id])
		@parentFeature = Feature.find(@parentSuite.feature_id)
	end

	def load
		@suite = TestSuite.find(params[:id])
		@testCases = TestCase.find(:all, :conditions => ['suite_id = ?', @suite.id])
		render :json => @testCases
	end

	def create
		@testCase = TestCase.new(case_params)
		@testCase.customer_id = Customer.find_id(params[:customer])
		@testCase.payment_method = params[:payment]


		respond_to do |format|
	      if @testCase.save
	        format.html { redirect_to root_path, notice: 'Test Case was successfully created.' }
	        format.json { render json: @testCase, status: :created, location: @testCase }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @testCase.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@testCase = TestCase.find(params[:id])
		@testCase.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { head :no_content }
		end
	end

	def update
		set_case
	    respond_to do |format|
	      if @testCase.update(feature_params)
	        format.html { redirect_to root_path, notice: 'Test Case was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @testCase.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	def edit
		set_case
  	end

	private
	    def set_case
	      @testCase = TestCase.find(params[:id])
	    end

		def case_params
	      params.require(:test_case).permit(:name)
	    end
end
