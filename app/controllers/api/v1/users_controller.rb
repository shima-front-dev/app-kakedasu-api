class Api::V1::UsersController < ApplicationController
    before_action :authenticate_active_user

    def show
        @user = User.find(params[:id])
        render json: @user
    end


end
