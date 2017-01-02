require_relative '../feature_helper'

feature 'News items belong to location', '
  In order to know where things happen
  As a visitor
  I want to be able to see locations of news items
' do

  let(:global_news_item) { create :global_news_item }

  before do
    generate_zoom_limits
    global_news_item.locations.create([{ name: 'NY' }, { name: 'Moscow' }])
  end

  scenario 'Visitor see locations in news items' do
    visit root_path

    within '#global-news' do
      expect(page).to have_content('NY')
      expect(page).to have_content('Moscow')
    end
  end
end
