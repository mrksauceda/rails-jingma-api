class Api::V1::LikesController < Api::V1::BaseController

  acts_as_token_authentication_handler_for User, except: [:total_likes]

  def like
    # curl -i -X POST                                                              \
    #  -H 'Content-Type: application/json'                                     \
    #  -H 'X-User-Email: pitipon@gmail.com'                                      \
    #  -H 'X-User-Token: n-TpyxLbRue6JATZQ77B'                                 \
    #  -d '{ "item_id": 1  }' \
    #  http://localhost:3000/api/v1/likes/like
    @item = Item.find(params[:item_id])
    @item.liked_by current_user
    render json: {}, status: :ok
  end

  def unlike
    # curl -i -X POST                                                              \
    #  -H 'Content-Type: application/json'                                     \
    #  -H 'X-User-Email: pitipon@gmail.com'                                      \
    #  -H 'X-User-Token: n-TpyxLbRue6JATZQ77B'                                 \
    #  -d '{ "item_id": 1  }' \
    #  http://localhost:3000/api/v1/likes/unlike
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
