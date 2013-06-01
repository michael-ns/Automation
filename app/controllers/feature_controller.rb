class FeatureController < ApplicationController
	def list
		@features = Feature.all
	end

	def create
		@feature = Feature.new(user_params)

		respond_to do |format|
			if @feature.save
				render :partial => 'subject', :object => @subject
			end
		end
	end	
end
