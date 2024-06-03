class ProductStock < ApplicationRecord
  belongs_to :product
  belongs_to :stock
end
