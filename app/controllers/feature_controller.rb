class FeatureController < ApplicationController
	def index
		@features = Feature.all
	end
end
