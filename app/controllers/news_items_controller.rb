class NewsItemsController < ApplicationController
  respond_to :js, :json

  before_action :set_news_items

  def index
    respond_with(@news_items)
  end

  private

  def set_news_items
    @news_items = NewsItem.global.limit(3).or(NewsItem.local.limit(3))
  end
end
