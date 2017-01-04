class ClergymenController < ApplicationController
  def index
    respond_with(@clergymen = Clergyman.all)
  end

  def show
    respond_with(@clergyman = Clergyman.find(params[:id]))
  end
end
