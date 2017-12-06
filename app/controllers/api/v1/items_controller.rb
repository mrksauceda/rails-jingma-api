class Api::V1::ItemsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_item, only: [ :show, :update, :destroy ]

  def index
    # curl -s http://localhost:3000/api/v1/items | jq

    @items = policy_scope(Item)
    # @items = Item.all
  end

  def show
    # curl -s http://localhost:3000/api/v1/items/:id | jq

    # @item
  end

  def update
    # curl -i -X PATCH                                        \
    #    -H 'Content-Type: application/json'              \
    #    -H 'X-User-Email: pitipon@gmail.com'               \
    #    -H 'X-User-Token: bDxtRPsodcrXoHAaLA62'          \
    #    -d '{ "item": { "price": "50", "discount": "80","description": " pancake is ok","image_url": "www.abc.com/abc.jpg","category": "food", "is_private": true, "latitude": 33.3012, "longitude": 35.2541  } }' \
    #    http://localhost:3000/api/v1/items/:id

    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end

  def create
    # curl -i -X POST                                                              \
    #  -H 'Content-Type: application/json'                                     \
    #  -H 'X-User-Email: pitipon@gmail.com'                                      \
    #  -H 'X-User-Token: bDxtRPsodcrXoHAaLA62'                                 \
    #  -d '{ "item": { "price": "20", "discount": "50","description": "Jian bing dao pancake is the best","image_url": "www.abc.com/abc.jpg","category": "food", "is_private": true, "latitude": 33.3012, "longitude": 35.2541  } }' \
    #  http://localhost:3000/api/v1/items

    p "------------------------------------------------------------"

    @item = Item.new(item_params)
    p @item
    @item.user = current_user
    p @item
    authorize @item
    if @item.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy

    # curl -i -X DELETE                               \
    #  -H 'X-User-Email: pitipon@gmail.com'         \
    #  -H 'X-User-Token: tvpPiz4yGYq_Mb8jYat5'    \
    #  http://localhost:3000/api/v1/items/:id

    @item.destroy
    head :no_content

  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize @item  # For Pundit
  end

  def item_params
    params.require(:item).permit(:price, :discount, :description, :image_url, :category, :is_private, :latitude, :longitude)
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end
end
