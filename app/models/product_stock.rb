class ProductStock < ApplicationRecord
  belongs_to :product
  belongs_to :stock
  def self.product_amount(p_id)
    p_amount = 0
    where(product_id: p_id).each do |p_s|
      p_amount += p_s.amount
    end
    p_amount
  end
end
