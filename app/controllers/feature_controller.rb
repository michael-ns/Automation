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

	def destroy
		@feature = Feature.find(params[:id])
		@feature.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.json { head :no_content }
		end
	end

	def update
		set_feature
	    respond_to do |format|
	      if @feature.update(feature_params)
	        format.html { redirect_to root_path, notice: 'Feature was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @feature.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	def edit
		set_feature
  	end

	private
	    def set_feature
	      @feature = Feature.find(params[:id])
	    end

		def feature_params
	      params.require(:feature).permit(:name)
	    end
end
