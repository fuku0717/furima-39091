FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567'}
    prefecture_id { 3 }
    municipalities { '横浜市緑区' }
    address { '3-4' }
    building_name { '青山ビル' }
    telephone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
