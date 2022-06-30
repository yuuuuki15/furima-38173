FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1-1' }
    building_name { '1-1-1' }
    phone_number { '12345678901' }
    token { 'token' }
  end
end
