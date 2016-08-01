module SessionHelpers
  def sign_up_with(email, password)
    visit new_user_registration_path
    within '#registration-form' do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'
    end
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    within '#login-form' do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Sign in'
    end
  end

end