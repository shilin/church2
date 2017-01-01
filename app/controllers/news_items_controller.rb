class NewsItemsController < ApplicationController
  respond_to :js, :json

  before_action :set_news_items

  def index
    respond_with(@news_items)
  end

  private

  def set_news_items
    @news_items = NewsItem.global.limit(Zoomable.global_limit)
                          .or(NewsItem.local.limit(Zoomable.local_limit)).merge(:approved)
  end
end
