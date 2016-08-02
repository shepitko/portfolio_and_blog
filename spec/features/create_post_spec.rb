require_relative '../feature_helper'

feature 'Create post', %q{
  In blog for presenting my articles
  as an authentificate user with role admin
  I want to be able to create posts
} do
  let(:user){ create(:user) }
  let(:admin){ create(:admin) }
  context 'does not see link "create post"' do
    scenario 'non-registered user' do
      visit posts_path
      expect(page).to_not have_content('Create new post')
    end
    scenario 'user has not admin role' do
      login_as user
      visit posts_path
      expect(page).to_not have_content('Create new post')
    end
  end

  scenario 'admin user can create post' do
    login_as admin
    visit posts_path  
    click_on 'Create new post'

    fill_in 'Title', with: 'test title'
    fill_in 'Content', with: 'test content'
    click_on 'Create'
    expect(page).to have_content('Your post successfully created.')
  end

  context 'access to create post page' do
    scenario 'non-registered user' do
      visit new_post_path
      expect(current_path).to eq(posts_path)
    end
    scenario 'user has not admin role' do
      login_as user
      visit new_post_path
      expect(current_path).to eq(posts_path)
    end
    scenario 'admin user' do
      login_as admin
      visit new_post_path
      expect(current_path).to eq(new_post_path)
    end
  end
end