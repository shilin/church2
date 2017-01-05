# encoding: utf-8
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

  let!(:landline_phone) { create(:landline_phone) }
  let!(:mobile_phone) { create(:mobile_phone) }
  let!(:fax_phone) { create(:fax_phone) }

  let!(:private_landline_phone) { create(:landline_phone, for_public: false) }

  before do
    congregation.addresses << [geo_address, postal_address]
    congregation.phones << [private_landline_phone, landline_phone, mobile_phone, fax_phone]
  end

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

    expect(page).to_not have_content(private_landline_phone.number)

    within('.congregation-landline') do
      expect(page).to have_content('Городск.:')
      expect(page).to have_content(landline_phone.number)
    end

    within('.congregation-mobile') do
      expect(page).to have_content('Моб.:')
      expect(page).to have_content(mobile_phone.number)
    end

    within('.congregation-fax') do
      expect(page).to have_content('Факс')
      expect(page).to have_content(fax_phone.number)
    end
  end
end
