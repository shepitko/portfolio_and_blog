FactoryGirl.define do
  factory :post do
    img_file_name 'post-controller-valid.jpg'
    title { FFaker::CheesyLingo.title }
    content { FFaker::HTMLIpsum.body }
  end
  factory :invalid_post, class: Post do
    img_file_name nil
    title nil
    content nil
  end
end
