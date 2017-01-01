class NewsItemsController < ApplicationController
  respond_to :js, :json

  before_action :set_news_items

  def index
    respond_with(@news_items_hash)
  end

  private

  def set_news_items
    @news_items_hash = { global: NewsItem.limited_by_zoom(:global)
                                         .approved.newest_first,
                         local: NewsItem.limited_by_zoom(:local)
                                        .approved.newest_first }
  end
end
