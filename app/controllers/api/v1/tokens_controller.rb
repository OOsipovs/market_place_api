require "jwt"

class Api::V1::TokensController < ApplicationController
  SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        token: JWT.encode(@user.id, SECRET_KEY),
        email: @user.email
      }
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
