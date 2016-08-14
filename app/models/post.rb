class Post < ApplicationRecord
  validates :img, :title, :content, presence: true

  has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :img, :in => 0.megabytes..2.megabytes

  has_and_belongs_to_many :categories
  #, inverse_of: :post
  accepts_nested_attributes_for :categories
  validates_presence_of :categories
end
