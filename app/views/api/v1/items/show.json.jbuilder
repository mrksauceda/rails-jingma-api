json.extract! @item, :price, :discount, :description,
  :image_url, :category, :is_private,
  :latitude, :longitude, :location
json.extract! @item, :num_likes, :num_comments
json.user do
      json.extract! @item.user, :name, :avatar_url
end
  ##### we can put more JSON DATA here, such as
  ##### view comment , view like , view price , view discount and etc.

  # json.comments @item.comments do |comment|
  #   json.extract! comment, :id, :content
  # end
