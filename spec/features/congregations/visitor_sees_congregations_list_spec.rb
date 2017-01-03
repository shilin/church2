require_relative '../feature_helper'

feature 'visitor can see ordered congregations', '
  In order to know about congregations
  As a visitor
  I want to be able to get ordered info about congregations
' do

  let!(:congregations) { create_list(:congregation, 2) }

  scenario 'guest visits congregation page and see ordered list of them' do
    visit congregations_path

    expect(all('.congregation-name')[0]).to have_content('MyCongregationName2')
    expect(all('.congregation-name')[1]).to have_content('MyCongregationName1')
  end
end
