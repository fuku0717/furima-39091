class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :item_name, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price, :user, presence: true

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank" }

end