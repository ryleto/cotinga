class UsersController < ApplicationController
    before_action :authenticate_user!
    #before_action :correct_user, only: [:show, :edit, :update]
    before_action :user_privilege, :only => [:index, :destroy]
    
    def index
        @users = User.paginate(page: params[:page])
    end
  
    def show
        @user = User.find(params[:id])
        unless @user == current_user || current_user.admin?
          redirect_to :back
        end
    end
    
    def new
        @user = User.new
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
          flash[:danger] = "There was a problem updating your account"
          redirect_to edit_user_path(current_user)
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
        
        # confirms current user matches requested user data
        #def correct_user
        #  if user_signed_in?
        #    @user = User.find(params[:id])
        #    redirect_to(root_url) unless current_user?(@user)
        #  end
        #end
    
        def user_privilege
          authenticate_user!
        
          if current_user.admin
             return
          else
             redirect_to :back 
          end
        end
end
