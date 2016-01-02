class UserAdminController < ApplicationController
    before_action :authenticate_user!
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
    
        if @user.save
          redirect_to user_url, notice: "User succesfully created!"
        else
          render 'new'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :company, :email, :password, :password_confirmation, :role)
    end
end
