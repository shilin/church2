require_relative '../feature_helper'

feature 'visitor can see congregation', '
  In order to know about congregation
  As a visitor
  I want to be able to get info about congregation
' do

  let(:location) { create(:location) }
  let!(:congregation) { create(:congregation, location: location) }
  let!(:geo_address) { create(:geo_address) }
  let!(:postal_address) { create(:postal_address) }

  before { congregation.addresses <<  [geo_address, postal_address] }

  scenario 'guest visits congregation page and see its content' do
    visit congregation_path(congregation)

    expect(page).to have_content('MyCongregationName1')
    expect(page).to have_content('MyLocation1')

    within('.congregation-geo-address') do
      expect(page).to have_content('MyGeoAddress')
    end
    within('.congregation-postal-address') do
      expect(page).to have_content('MyPostalAddress')
    end
  end
end
