class ArticlesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if params[:tag]
            @articles = Article.tagged_with(params[:tag]).paginate(page: params[:page])
        else
            @articles = Article.paginate(page: params[:page])
        end
    end
    
    def show
        @article = Article.find(params[:id])
        @comments = @article.comments.paginate(page: params[:page])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
          flash[:info] = "Thank you. Your article has been posted."
          redirect_to articles_path
        else
          render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
          flash[:success] = "Article updated"
          redirect_to articles_path
        else
          render 'edit'
        end
    end
    
    def destroy
        Article.find(params[:id]).destroy
        flash[:success] = "Article deleted"
        redirect_to articles_path
    end
    
    private
    
        def article_params
          params.require(:article).permit(:pubdate, :title, :body, :source, :publish, :tag_list)
        end
end
