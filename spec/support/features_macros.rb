module FeaturesMacros
  def sign_in(user)
    visit '/admin'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def generate_zoom_limits
    create(:global_zoom_limit)
    create(:local_zoom_limit)
  end
end
