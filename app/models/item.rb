class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :user, presence: true

  has_one_attached :image
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :shipping_charge
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :days_to_ship
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" }

end