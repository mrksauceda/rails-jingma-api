json.array! @comments do |comment|
  json.extract! comment, :id, :body
  json.extract! comment, :comment_likes

  json.user do
    json.extract! comment.user, :name, :avatar_url
  end
end
