class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  has_one_attached :image
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture_id 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :days_to_ship_id
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :category_id
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :condition_id
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :shipping_charge_id
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" }


end