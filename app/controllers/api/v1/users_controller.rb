class Api::V1::UsersController < Api::V1::BaseController
 respond_to :json
 acts_as_token_authentication_handler_for User, except: [:create ]

 before_action :set_user, only: []

 after_action :verify_authorized, except: [:create]


 URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


 def create

   # Send code, APPID and SECRET to weixin for openid and session_key
   @user = User.find_by_email(wechat_email) || User.create(user_params)

   render json: @user if @user.persisted?

 end

 private

 def wechat_email
   @wechat_email ||= wechat_user.fetch('openid')  + "@salmon.com"
 end

 def user_params
   return @user_params if @user_params

   @user_params = set_params

   # GET both openid and session_key
   @user_params['email'] = wechat_email
   @user_params['password'] = wechat_user.fetch('session_key', Devise.friendly_token)
   @user_params['authentication_token'] = Devise.friendly_token
   @user_params
 end

 def wechat_user
   @wechat_response ||= RestClient.post( URL, wechat_params )
   @wechat_user ||= JSON.parse(@wechat_response.body)
 end

 def wechat_params
   { appid: ENV["MP_APPID"],
     secret: ENV["MP_SECRET"],
     js_code: params[:code],
     grant_type: "authorization_code" }
 end

 def set_user
   @user = User.find(params[:id])
   authorize @user  # For Pundit
 end

 def set_params
   params.require(:user).permit(:nickname, :gender, :language, :avatar, :bio, :tag_list, :latitude, :longitude, :phone)
 end
end
