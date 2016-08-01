require_relative '../feature_helper'

feature 'User sign up' do
  let(:user){create(:user)}
  before do 
    logout(:user)
  end
  scenario 'with valid fields' do 
    sign_up_with("test@email.tt", '12345678')
    expect(page).to have_content('Welcome! You have signed up successfully')
  end

  context 'with invalid fields' do
    scenario 'empty password' do
      sign_up_with("ya@ya.ya", '')
      expect(page).to have_content('Password can\'t be blank')
    end
    scenario 'short password' do
      sign_up_with("ya@ya.ya", '12')
      expect(page).to have_content('Password is too short')
    end
  end

end