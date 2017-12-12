json.items do
  json.array! @items do |item|
    json.extract! item, :id, :price, :discount, :description, :image_url, :category, :is_private, :latitude, :longitude, :location, :item_created_at
    json.extract! item, :num_likes, :num_comments
    json.liked_by_current_user !!(current_user && current_user.liked?(item))
    # json.liked_by_current_user !!(current_user && item.liked_by(current_user))

    json.user do
          json.extract! item.user, :name, :avatar_url
    end
  end
end



json.prev_page path_to_prev_page(@items)
json.next_page path_to_next_page(@items)

# json.array! @comments do |comment|
#   json.extract! comment, :id, :body
#   json.extract! comment, :comment_likes
# end
