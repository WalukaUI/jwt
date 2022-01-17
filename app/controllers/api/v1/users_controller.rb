class Api::V1::UsersController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.valid?
          render json: { user: UserSerializer.new(@user) }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :unprocessable_entity
        end
      end

      def profile
        render json: {user: "waluka2222"}.to_json()
      end
      
      def show
        user = User.all
        render json: user.to_json()
      end

    
      private
      def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar)
      end
end
