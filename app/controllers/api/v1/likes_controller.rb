class Api::V1::LikesController < Api::V1::BaseController

  acts_as_token_authentication_handler_for User, except: [:total_likes]

  def like
    @item = Item.find(params[:item_id])
    @item.liked_by current_user
    render json: {}, status: :ok
  end

  def unlike
    @item = Item.find(params[:item_id])
    @item.unliked_by current_user
    render json: {}, status: :ok
  end

  def total_likes
    @item = Item.find(params[:item_id])
    @item.get_likes.size
    render json: {}, status: :ok
  end
end


#This LikesController is using the acts_as_votable gem.

#User can use appropriate VERB with corresponding URI Pattern to execute this API
#through the Postman application. For example to use the like-method the two paramaters
#it takes is the id, and the body(message)
