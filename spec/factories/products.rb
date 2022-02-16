FactoryBot.define do
  factory :product do
    product_title {Faker::Lorem.sentence}
    product_concept {Faker::Lorem.sentences}
    product_category_id { 2 }
    product_situation_id { 2 }
    send_load_id { 2 }
    send_source_area_id { 2 }
    send_day_id { 2 }
    price = Faker::Commerce.price
    product_price {price}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
