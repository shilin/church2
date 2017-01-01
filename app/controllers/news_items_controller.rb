class NewsItemsController < ApplicationController
  respond_to :js, :json

  before_action :set_news_items

  def index
    respond_with(@news_items_hash)
  end

  private

  def set_news_items
    @global = NewsItem.limited_by_zoom(:global).approved.newest_first
    @local = NewsItem.limited_by_zoom(:local).approved.newest_first
    @news_items_hash = { global: @global,
                         local: @local }
  end
end
