FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    product_detail {Faker::Lorem.sentence}
    price {3000}
    category_id {3}
    status_id {3}
    postage_id {3}
    prefecture_id {3}
    shipment_id {3}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
