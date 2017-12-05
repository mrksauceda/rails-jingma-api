json.extract! @item, :price, :discount, :description,
  :image_url, :category, :is_private,
  :latitude, :longitude

  ##### we can put more JSON DATA here, such as
  ##### view comment , view like , view price , view discount and etc.

  # json.comments @item.comments do |comment|
  #   json.extract! comment, :id, :content
  # end
