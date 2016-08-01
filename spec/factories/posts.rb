FactoryGirl.define do
  factory :post do
    post_img { FFaker::Avatar.image }
    title { FFaker::CheesyLingo.title }
    content { FFaker::HTMLIpsum.body }
  end
  factory :invalid_post, class: Post do
    post_img nil
    title nil
    content nil
  end
end
