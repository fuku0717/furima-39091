FactoryBot.define do
  factory :item do
    item_name          {'商品名'}
    explanation        {'商品の説明'}
    category_id        {'2'}
    condition_id       {'2'}
    shipping_charge_id {'2'}
    prefecture_id      {'2'}
    days_to_ship_id    {'2'}
    price              {'1234'}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/timage.png'), filename: 'timage.png')
    end
  end
end
