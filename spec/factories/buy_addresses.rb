FactoryBot.define do
  factory :buy_address do
    post_code { '123-4567' }
    prefecture_id { 4 }
    city { '港区' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number {12345678902}
  end
end
