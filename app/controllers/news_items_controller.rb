class NewsItemsController < ApplicationController
  respond_to :js, :json

  before_action :set_news_items

  def index
    respond_with(@news_items_hash)
  end

  private

  def set_news_items
    @news_items_hash = { global: NewsItem.global_list,
                         local: NewsItem.local_list }
  end
end
