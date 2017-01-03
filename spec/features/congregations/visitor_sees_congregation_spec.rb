require_relative '../feature_helper'

feature 'visitor can see congregation', '
  In order to know about congregation
  As a visitor
  I want to be able to get info about congregation
' do

  let(:congregation) { create(:congregation) }

  scenario 'guest visits congregation page and see ordered list of them' do
    visit congregation_path(congregation)

    expect(page).to have_content('MyCongregationName1')
  end
end
