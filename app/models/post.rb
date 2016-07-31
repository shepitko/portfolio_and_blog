class Post < ApplicationRecord
  validates :post_img, :title, :content, presence: true
end
