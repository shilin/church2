module FeaturesMacros
  def sign_in(user)
    visit '/admin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end
end
