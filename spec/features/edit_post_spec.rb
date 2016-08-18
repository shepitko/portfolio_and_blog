require_relative '../feature_helper'

feature 'Update post', %q{
  In blog for presenting my articles
  as an authentificate user with role admin
  I want to be able to edit posts
} do

  let(:user){ create(:user) }
  let(:admin){ create(:admin) }
  let!(:post){ create(:post) }

  context 'as admin' do
    let!(:categories){ create_list(:category, 5) }
    before do
      login_as admin
      visit posts_path
      within("#post_#{post.id}") do
        click_on 'edit'
      end
    end

    scenario 'has access to edit post' do
      expect(current_path).to eq(edit_post_path(post))
    end

    scenario 'can edit post' do
      fill_in 'Title', with: post.title
      fill_in 'Content', with: post.content
      attach_file 'Img', "#{Rails.root}/spec/fixtures/img/img_file.png"
      select categories.first.name, from: 'Categories'
      click_on 'Update Post'
      expect(current_path).to eq(post_path(post))
      expect(page).to have_content('Post was successfully updated')
    end

    scenario 'invalid fields' do
      fill_in 'Title', with: ''
      fill_in 'Content', with: ''
      attach_file 'Img', "#{Rails.root}/spec/fixtures/img/img_file.png"
      select categories.first.name, from: 'Categories'
      click_on 'Update Post'
      expect(page).to have_content('can\'t  be blank')
    end
  end
  

  context 'hasn\'t access to edit post' do
    after do
      visit edit_post_path(post)
      expect(current_path).to eq(posts_path)
      expect(page).to have_content('Admins only')
    end

    scenario 'as user' do
      login_as user
    end
    scenario 'as guest' do
    end
  end


end