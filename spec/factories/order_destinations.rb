FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    prefecture_code_id { 2 }
    city { '青森県' }
    house_number { '1-1'}
    build_number { '青森ハイツ' }
    phone_number {'09098765432'}
    user_id { 1 }
    item_id { 1 }
    price {5000}
    token {'jijijijiji'}

  end
end
