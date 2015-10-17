class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :correct_user,   only: :destroy
    
    def new
        @comment = Comment.new
    end
    
    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            flash[:success] = "Comment submitted!"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
        @comment.destroy
        flash[:success] = "Comment deleted"
        redirect_to request.referrer || root_url
    end
    
    private

        def comment_params
          params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
        end
        
        def correct_user
          @comment = current_user.comments.find_by(id: params[:id])
          redirect_to root_url if @comment.nil?
        end
end
