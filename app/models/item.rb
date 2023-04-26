class Item < ApplicationRecord
  validates :image, presence:true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, message: 'は半角数値のみ保存可能です' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は¥300~¥9,999,999の間のみ保存可能です' }

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "を選択して下さい" }

  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "を選択して下さい" }

  belongs_to :shipping_charge
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "を選択して下さい" }

  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択して下さい" }

  belongs_to :days_to_ship
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "を選択して下さい" }

end