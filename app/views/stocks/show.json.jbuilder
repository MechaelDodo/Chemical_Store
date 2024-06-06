json.array! @product.stocks.each do |stock|
  json.stock_title stock.title
  json.product_title @product.title
  json.amount ProductStock.find_by(product_id: @product.id, stock_id: stock.id).amount
end

