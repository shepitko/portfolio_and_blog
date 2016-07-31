require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:post_img) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
