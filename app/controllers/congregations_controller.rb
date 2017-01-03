class CongregationsController < ApplicationController
  def index
    respond_with(@congregations = Congregation.ordered_by_name)
  end

  def show
    respond_with(@congregation = Congregation.find(params[:id]))
  end
end
