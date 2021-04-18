FactoryBot.define do
  factory :order do
    postal_cord { '123-4567' }
    prefecture_id { 1 }
    city { '横浜市' }
    address { '横浜1-1-1' }
    building { 'テストビル101' }
    telephone { 12_345_678_900 }
    user_id { 1 }
    item_id { 1 }
    token { 'abcdefg_000000000000' }
  end
end
