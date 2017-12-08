class Api::V1::CommentsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def comment_index
    @comments = Comment.where(item_id: params[:item_id])
  end

  def create
  @comment = Comment.new(comments_param)
  @comment.user = current_user
  @comment.item_id = params[:item_id]
    if @comment.save
      render json: {}, status: :created
    else
      render_error
    end
  end

private

  def comments_param
    params.require(:comment).permit(:body)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages },
      status: :unprocessable_entity
  end
end

#   def new
#   @comment = Comment.new
#   end

# def show
#   @comment = Comment.find(params[:id])
#   end
