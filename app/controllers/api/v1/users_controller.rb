class Api::V1::UsersController < ApplicationController
    def show
        render json: @user = User.find(params[:id])
    end
end
