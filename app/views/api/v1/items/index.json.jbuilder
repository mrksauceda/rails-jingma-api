json.array! @items do |item|
  json.extract! item, :id, :price, :discount, :description
end
