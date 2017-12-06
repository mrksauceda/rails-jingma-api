class Api::V1::LikesController < Api::V1::BaseController

  acts_as_token_authentication_handler_for User

  def like
    @item = Item.find(params[:item_id])
    @item.liked_by current_user
  end

  def unlike
    @item = Item.find(params[:item_id])
    @item.unliked_by current_user
  end

end
