class Api::V1::HelloController < ApplicationController
    def index
        # render json: "Hello"
        @users = User.all
        render json: @users
      end
end
