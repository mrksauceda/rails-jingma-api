json.array! @items do |item|
  json.extract! item, :id, :price, :discount, :description, :image_url, :category, :is_private, :latitude, :longitude
end
