class Api::V1::CommentsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [:index ]

  def index
    # curl -s http://localhost:3000/api/v1/items/:item_id/comments
    @comments = Comment.where(item_id: params[:item_id]).order('created_at DESC')
  end

  def create

    # curl -i -X POST                                                              \
    #  -H 'Content-Type: application/json'                                     \
    #  -H 'X-User-Email: pitipon@gmail.com'                                      \
    #  -H 'X-User-Token: n-TpyxLbRue6JATZQ77B'                                 \
    #  -d '{ "comment": { "body": "Test comment"  } }' \
    #  http://localhost:3000/api/v1/items/:item_id/comments


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
