# encoding: utf-8
require_relative '../feature_helper'

feature 'anyone sees news on front page', '
  In order to get info
  As a visitor
  I want to be able to see news
' do

  let!(:global_news_item) { create(:global_news_item, body_preview: 'MyGlobalBodyPreview') }
  # let!(:global_news_item) { create_list(:global_news_item, {body_preview: 'MyGlobalBodyPreview'}, 4) }
  # let!(:local_news_item) { create_list(:local_news_item, 4) }
  let!(:local_news_item) { create(:local_news_item, body_preview: 'MyLocalBodyPreview') }

  scenario 'Visitor tries to see news' do
    visit root_path

    within '#global-news' do
      expect(page).to have_content('Новости')
      expect(page).to have_content('MyGlobalBodyPreview')
    end

    within '#local-news' do
      expect(page).to have_content('Новости приходов')
      expect(page).to have_content('MyLocalBodyPreview')
    end

    # expect(page).to have_content('MyBody2')
  end
end
