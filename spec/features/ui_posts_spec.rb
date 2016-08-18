require_relative '../feature_helper'

feature 'UI for pages posts', %q{
  In blog for presenting my articles
  as an authentificate user with role admin
  I want to be able to see buttons(create, edit and delete)
} do
  let(:user){ create(:user) }
  let(:admin){ create(:admin) }
  let!(:posts){ create_list(:post, 5) }

  context 'does not see links of manage' do
    after{
      visit posts_path
      expect(page).to_not have_link('Create new post')
      expect(page).to_not have_link('edit')
      expect(page).to_not have_link('delete')
    }
    scenario 'non-registered user' do
    end
    scenario 'user has not admin role' do
      login_as user
    end
  end

  scenario 'as admin I can see links of manage ' do
    login_as admin
    visit posts_path
    expect(page).to have_link('Create new post')
    expect(page).to have_link('edit')
    expect(page).to have_link('delete')
  end
end