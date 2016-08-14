FactoryGirl.define do
  factory :category do
    name { FFaker::Skill.tech_skill }
  end
end
