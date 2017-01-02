require_relative '../feature_helper'

feature 'anyone sees exact number of news on front page', '
  In order not to be overwhelmed by info
  As a visitor
  I want to be able to see reasonable amount of news
' do

  let!(:global_news_item_list) { create_list(:global_news_item, 10) }
  let!(:local_news_item_list) { create_list(:local_news_item, 9) }

  let!(:second_newest_global_news_item) { create(:global_news_item, body_preview: 'MySecondNewest') }
  let!(:newest_global_news_item) { create(:global_news_item, body_preview: 'MyFirstNewest') }

  let(:global_zoom_limit) { create(:global_zoom_limit, limit: 3) }
  let(:local_zoom_limit) { create(:local_zoom_limit, limit: 2) }

  scenario 'Visitor see fallback amount of ordered latest first news' do
    visit root_path

    within '#global-news' do
      expect(page).to have_selector('.news-item', count: ZoomLimit::FALLBACK_ZOOM_LIMIT)
    end

    within '#local-news' do
      expect(page).to have_selector('.news-item', count: ZoomLimit::FALLBACK_ZOOM_LIMIT)
    end
  end

  scenario 'Visitor see sound amount of ordered latest first news' do
    global_zoom_limit
    local_zoom_limit

    visit root_path

    within '#global-news' do
      expect(page).to have_selector('.news-item', count: global_zoom_limit.limit)
    end

    within '#local-news' do
      expect(page).to have_selector('.news-item', count: local_zoom_limit.limit)
    end

    within '#global-news' do
      topmost_news = page.all('.news-item')[0]
      second_topmost_news = page.all('.news-item')[1]
      expect(topmost_news).to have_content('MyFirstNewest')
      expect(second_topmost_news).to have_content('MySecondNewest')
    end
  end
end
