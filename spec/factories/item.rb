FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    status_id {3}
    category_id {3}
    cost_id {2}
    plan_id {2}
    prefecture_code_id{2}
    price {rand(300..9999999)}
    association :user



    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end

rand