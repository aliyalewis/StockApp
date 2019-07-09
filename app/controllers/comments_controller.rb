class CommentsController < ApplicationController

    before_action :set_comment, only: [:edit, :show, :update, :destroy]

    def index
        @comments = Comment.all 
    end

    def new
        @comment = Comment.new 
    end

    def create
        #need authentication
        @comment = Comment.new
        @comment.save(comment_params(:title, :content))
    end

    def update
        #need authentication - only a user can edit their own comment
        @comment.update(comment_params(:title, :content))
    end

    def destroy 
       @comment.delete 
       redirect_to comments_path
    end

    private
    def set_comment
        @comment = Comment.find(params[:user][:id])
    end

    def comment_params(*args)
        require(:comment).permit(:title, :content)
    end
 

end
