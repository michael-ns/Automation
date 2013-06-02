class FeatureController < ApplicationController
	def create
		@feature = Feature.new(feature_params)

		respond_to do |format|
	      if @feature.save
	        format.html { redirect_to root_path, notice: 'feature was successfully created.' }
	        format.json { render json: @feature, status: :created, location: @feature }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @feature.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def feature_params
      params.require(:feature).permit(:name)
    end
end
