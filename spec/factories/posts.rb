FactoryGirl.define do
  factory :post do
    post_img { FFaker::Avatar.image }
    title { FFaker::CheesyLingo.title }
    content { FFaker::HTMLIpsum.body }
  end
end
