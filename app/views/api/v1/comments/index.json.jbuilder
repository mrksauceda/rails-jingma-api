json.array! @comments do |comment|
  json.extract! comment, :id, :body
  json.extract! comment, :comment_likes, :item_created_at

  json.user do
    json.extract! comment.user, :name, :avatar_url
  end
end
