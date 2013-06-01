class UserInterfaceController < ApplicationController
  def index
  	getFeatures
  end

  def create
  end

  def edit
  end

  def getFeatures
  	@features = Feature.all
  end
end
