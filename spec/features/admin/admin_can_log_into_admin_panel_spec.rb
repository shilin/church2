require_relative '../feature_helper'

feature 'admin can log in into rails_admin panel', '
  In order to manage resources
  As an admin
  I want to be able to log in into admin section
' do

  let(:admin) { create :admin }
  let(:user) { create :user }

  scenario 'not logged in user is redirected to sign_in page', js: true do
    visit '/admin'
    expect(page).to have_content 'You are not admin'
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'admin tries to log into admin panel', js: true do
    sign_in(admin)
    sleep 2
    expect(current_path).to eq '/admin/'
    expect(page).to have_content 'Site Administration'
    expect(page).to have_content 'Log out'
  end

  scenario 'a regular registered user tries to log in into admin panel', js: true do
    sign_in(user)
    sleep 2
    expect(page).to have_content 'You are not admin'
    expect(current_path).to eq root_path
  end

  scenario 'User with invalid credentials tries to log in', js: true do
    visit '/users/sign_in'
    sleep 2
    fill_in 'Email', with: 'anyemail@test.com'
    fill_in 'Password', with: 'somegibberish'
    click_on 'Log in'
    sleep 1
    expect(page).to have_content 'Invalid Email or password'
    expect(current_path).to eq '/users/sign_in'
  end
end
