class Product < ApplicationRecord
  validates :title, presence: true
  has_many :product_stocks
  has_many :stocks, through: :product_stocks

  belongs_to :user
end
