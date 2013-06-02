class UserInterfaceController < ApplicationController
  def index
  	getFeatures
  	getNewFeature
  end

  def create
  end

  def edit
  end

  def getFeatures
  	@features = Feature.all
  end

  def getNewFeature
  	@feature = Feature.new
  end
end
