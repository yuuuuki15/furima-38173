FactoryBot.define do
  factory :item do
    # category_idは1以外の数字を指定する
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    prefecture_id { 2 }
    delivery_date_id { 2 }
    price { Faker::Number.number(digits: 4) }
    association :user

    after(:build) do |item|
      # publicディレクトリのtest_image.pngを添付する
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
