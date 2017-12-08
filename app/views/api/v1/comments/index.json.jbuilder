json.array! @comments do |comment|
  json.extract! comment, :id, :body
  json.extract! comment, :comment_likes
end
