class Api::V1::UsersController < Api::V1::BaseController
 respond_to :json
 acts_as_token_authentication_handler_for User, except: [:create ]

 after_action :verify_authorized, except: [:create]


 URL = "https://api.weixin.qq.com/sns/jscode2session".freeze


 def create
   p "---------------------------------------------------\n\n\n\n"
   # Send code, APPID and SECRET to weixin for openid and session_key


   @user = User.find_by(email: wechat_email) || User.create(user_params)

   p "\n\n\n\n----------------------------------------------------"
   render json: @user if @user.persisted?
  #  render json: @user
 end

 private

 def wechat_email
   @wechat_email ||= wechat_user.fetch('openid')  + "@salmon.com"
   @wechat_email.downcase!
   p "wechat_email:"
   p @wechat_email
   return @wechat_email
 end

 def user_params
   return @user_params if @user_params

   @user_params = set_params

   # GET both openid and session_key
   @user_params['email'] = wechat_email
   @user_params['password'] = wechat_user.fetch('session_key', Devise.friendly_token)
   @user_params['authentication_token'] = Devise.friendly_token

   p "user params:"
   p @user_params

   @user_params
 end

 def wechat_user
   p "RestClient - Request to Wechat Server - by this params"
   p wechat_params

   @wechat_response ||= RestClient.post( URL, wechat_params )

   p "Response from Server"
   p @wechat_response
   p "Response body"
   p @wechat_response.body

   @wechat_user ||= JSON.parse(@wechat_response.body)
 end

 def wechat_params
   { appid: ENV["MP_APPID"],
     secret: ENV["MP_SECRET"],
     js_code: params[:code],
     grant_type: "authorization_code" }
 end

 def set_params
   params.require(:user).permit(:name, :avatar_url, :gender, :province, :city)
 end
end
