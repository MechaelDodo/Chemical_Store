json.array! @stock.products.each do |product|
  if ProductStock.find_by(product_id: product.id, stock_id: @stock.id).amount != 0
    json.stock_title @stock.title
    json.product_title product.title
    json.amount ProductStock.find_by(product_id: product.id, stock_id: @stock.id).amount
  end
end

