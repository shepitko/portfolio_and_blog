class Post < ApplicationRecord
  validates :img, :title, :content, presence: true

  has_attached_file :img, :storage => :s3
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
end
