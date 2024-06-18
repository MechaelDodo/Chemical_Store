class Stock < ApplicationRecord
  validates :title, presence: true
  has_many :product_stocks, dependent: :delete_all
  has_many :products, through: :product_stocks
  belongs_to :user
end
