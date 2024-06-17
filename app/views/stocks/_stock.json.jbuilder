json.extract! stock, :id, :title, :created_at, :updated_at
json.url stock_url(stock, format: :json)
stock.products.each do |product|
  if ProductStock.find_by(product_id: product.id, stock_id: stock.id).amount != 0
    json.product_title product.title
    json.amount ProductStock.find_by(product_id: product.id, stock_id: stock.id).amount
  end
end