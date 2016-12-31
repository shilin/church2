class NewsItemsController < ApplicationController
  respond_to :js, :json

  def index
    respond_with(@news_items = NewsItem.all)
  end
end
