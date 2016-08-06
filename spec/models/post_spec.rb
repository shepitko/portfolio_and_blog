require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should have_attached_file(:img) }
    it { should validate_attachment_presence(:img) }
    it { should validate_attachment_content_type(:img).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:img).
                less_than(2.megabytes) }
  end
end
