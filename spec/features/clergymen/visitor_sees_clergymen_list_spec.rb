# encoding: utf-8
require_relative '../feature_helper'

feature 'visitor can see ordered clergymen', '
  In order to know about clergy
  As a visitor
  I want to be able to get ordered info about clergy
' do

  let!(:deacon) { create(:deacon) }
  let!(:pastor) { create(:pastor) }
  let!(:bishop) { create(:bishop) }

  scenario 'guest visits clergy page and see ordered list of them' do
    visit clergymen_path

    expect(page).to have_content('Имя')
    expect(page).to have_content('Чин')
    expect(page).to have_content('Рукоположен в диаконы')
    expect(page).to have_content('Рукоположен в священники')
    expect(page).to have_content('Поставлен в епископы')

    expect(page).to have_content('deacon')
    expect(page).to have_content('pastor')
    expect(page).to have_content('bishop')
  end
end
