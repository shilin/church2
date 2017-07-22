require_relative '../feature_helper'

feature 'only admin can add news', '
  In order to make our site informative
  As an admin
  I want to be able to add news to the site
' do

  let(:admin) { create :admin }

  scenario 'admin tries to add news', js: true do
    sign_in(admin)
    sleep 1
    first(:link, 'News items').click
    sleep 1
    click_on 'Add new'

    # first news
    fill_in 'Title', with: 'MyTitle1'
    fill_in 'Body', with: 'MyBody1'
    fill_in 'Body preview', with: 'MyBodyPreview1'
    check 'news_item_approved'

    click_on 'Save'

    expect(page).to have_content 'News item successfully created'

    visit root_path

    expect(page.all('#global-news')[0]).to have_content 'MyBodyPreview1'
  end
end
