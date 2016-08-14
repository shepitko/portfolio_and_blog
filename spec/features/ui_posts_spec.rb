require_relative '../feature_helper'

feature 'UI for pages posts', %q{
  In blog for presenting my articles
  as an authentificate user with role admin
  I want to be able to see buttons(create, edit and delete)
} do
  let(:user){ create(:user) }
  let(:admin){ create(:admin) }
  let!(:posts){ create_list(:post, 5) }

  context 'does not see link "create post"' do
    after{
      visit posts_path
      expect(page).to_not have_content('Create new post')
      expect(page).to_not have_content('edit post')
      expect(page).to_not have_content('delete post')
    }
    scenario 'non-registered user' do
    end
    scenario 'user has not admin role' do
      login_as user
    end
  end

  scenario 'as admin I can see manage link' do
    login_as admin
    visit posts_path
    expect(page).to have_content('Create new post')
    expect(page).to have_content('edit post')
    expect(page).to have_content('delete post')
  end
  
  ##for edit and delete feathure_specs
  
  # context 'manage posts' do
  #   context 'as admin' do
  #     before{ login_as admin }

  #     scenario 'have access to edit post' do
  #       visit edit_post_path(posts.first)
  #       expect(current_path).to eq(edit_post_path(posts.first))
  #     end
  #     scenario 'can delete post' do
  #       page.driver.delete("/posts/#{posts.first.id}")
  #       expect(current_path).to eq(posts_path)
  #       expect(current_path).to have_content('Post successfully deleted')
  #     end
  #   end
  #   context 'as user' do
  #     before { login_as user }
  #     after do
  #       expect(current_path).to eq(posts_path)
  #       expect(current_path).to have_content('Admins only')
  #     end
  #     scenario 'haven\'t access to edit post' do
  #       visit edit_post_path(posts.first)
  #     end
  #     scenario 'can\'t delete post' do
  #       page.driver.delete("/posts/#{posts.first.id}")
  #     end
  #   end
  #   context 'as guest' do
  #     after do
  #       expect(current_path).to eq(posts_path)
  #       expect(current_path).to have_content('Admins only')
  #     end
  #     scenario 'haven\'t access to edit post' do
  #       visit edit_post_path(posts.first)
  #     end
  #     scenario 'can\'t delete post' do
  #       page.driver.delete("/posts/#{posts.first.id}")
  #     end
  #   end
  # end
end