class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, :except => [:index]
    before_action :user_privilege, :only => [:show, :edit, :update]
    before_action :admin_only, :except => [:show, :edit, :update]
    
    def index
        @users = User.paginate(page: params[:page])
    end
  
    def show
        unless @user == current_user || current_user.admin?
          redirect_to :back
        end
    end
    
    def new
        @user = User.new
    end
    
    def edit
        unless @user == current_user || current_user.admin?
          redirect_to :back
        end
    end
    
    def update
        if @user.update_attributes(user_params)
          flash[:success] = "Profile updated"
          redirect_to @user
        else
          flash[:danger] = "There was a problem updating your account"
          redirect_to edit_user_path(current_user)
        end
    end
    
    def destroy
        @user.destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end
    
    private
        
        def set_user
            @user = User.find(params[:id])
        end
        
        def user_params
          params.require(:user).permit(:name, :company, :email, :password, :password_confirmation, :role)
        end
        
        def user_privilege
            if user_signed_in?
                unless @user == current_user || current_user.admin?
                    redirect_to(root_url)
                end
            end
        end
        
        def admin_only
            unless current_user.admin?
              redirect_to :back, :alert => "Access denied."
            end
        end
        
end
