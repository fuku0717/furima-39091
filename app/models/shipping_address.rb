class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record
  belongs_to :prefecture
end