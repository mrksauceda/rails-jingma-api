json.items do
  json.array! @items do |item|
    json.extract! item, :id, :price, :discount, :description, :image_url, :category, :is_private, :latitude, :longitude
  end
end

json.prev_page path_to_prev_page(@items)
json.next_page path_to_next_page(@items)
