class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.paginate(page: params[:page])
    end
  
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Profile updated"
          redirect_to @user
        else
          render "registrations/edit"
        end
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end
    
    private
    
        def user_params
          params.require(:user).permit(:name, :company, :email, :password, :password_confirmation)
        end
end
