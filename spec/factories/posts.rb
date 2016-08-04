FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "MyTitle#{n}" }
    username 'user'
    body 'test'
  end
end