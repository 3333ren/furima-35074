FactoryBot.define do
  factory :item do
    name { 'テスト' }
    describe { Faker::Lorem.sentence }
    category_id { '1' }
    condition_id { '2' }
    shipping_fee_id { '1' }
    prefecture_id { '2' }
    shipping_day_id { '1' }
    price { '5000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
