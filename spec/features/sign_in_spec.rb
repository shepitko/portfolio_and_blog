require_relative '../feature_helper'

feature 'User sign in' do
  let(:user){create(:user)}
  before do 
    logout(:user)
  end
  context 'try to sign in' do
    scenario 'registered user ' do 
      sign_in_with(user.email, user.password)
      expect(page).to have_content('Signed in successfully')
      #expect(page).to have_content('logout')
      expect(current_path).to eq(root_path)
    end

    scenario 'non-registered user' do
      sign_in_with("ya@ya.ya", 'bla-bla-bla')
      expect(page).to have_content('Invalid Email or password')
      expect(current_path).to eq(new_user_session_path)
    end
  end

end