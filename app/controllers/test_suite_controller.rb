class TestSuiteController < ApplicationController
	def load
		@feature = Feature.find(params[:id])
		@testSuites = TestSuite.find(:all, :conditions => ['feature_id = ?', @feature.id])
		render :json => @testSuites
	end

	def create
		@suite = TestSuite.new(suite_params)
		@suite.feature_id = params[:feature_id]

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

	def update
		set_suite
		respond_to do |format|
			if @suite.update(suite_params)
				format.html { redirect_to root_path, notice: 'Feature was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @suite.errors, status: :unprocessable_entity }
			end
		end
	end		

	def destroy
		@suite = TestSuite.find(params[:id])
		@suite.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { head :no_content }
		end
	end

	def edit
		set_suite
	end

	private
	    def set_suite
	      @suite = TestSuite.find(params[:id])
	    end

		def suite_params
	      params.require(:test_suite).permit(:name)
	    end
end
