require_relative '../feature_helper'

feature 'Delete post', %q{
  In blog for presenting my articles
  as an authentificate user with role admin
  I want to be able to delete posts
} do

  let(:user){ create(:user) }
  let(:admin){ create(:admin) }
  let!(:post){ create(:post) }

  scenario 'admin can delete post', :js do
    login_as admin
    visit posts_path
    within("#post_#{post.id}") do
      page.accept_confirm { click_on 'delete' }
    end
    expect(page).to have_content('Post was successfully destroyed')
  end
  context 'can\'t delete post' do
    after do
      within("#post_#{post.id}") do
        expect(page).to_not have_link 'delete'
      end
    end
    scenario 'as user' do
      login_as user 
      visit posts_path
    end
    scenario 'as guest' do
      visit posts_path
    end
  end
end