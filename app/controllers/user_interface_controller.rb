class UserInterfaceController < ApplicationController
  def index
  	getFeatures
  	getNewFeature
    getSuites
    getNewSuite
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

  def getSuites
    @testSuites = TestSuite.all
  end

  def getNewSuite
    @testSuite = TestSuite.new
  end
end
