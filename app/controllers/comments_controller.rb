class CommentsController < ApplicationController

    before_action :set_comment, only: [:edit, :show, :update, :destroy]
    before_action :logged_in?, only:[:new, :create, :edit, :update, :destroy]

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        if authorized? == true
            @comment = Comment.new
            @comment.save(comment_params(:title, :content))
        else
            redirect_to login_path
        end
    end

    def edit
        if authorized? == true
            render :edit
        else
            redirect_to login_path
        end
    end

    def update
        if authorized? == true
            @comment.update(comment_params(:title, :content))
        else
            redirect_to login_path
        end
    end

    def destroy
        if authorized? == true
            @comment.delete
            redirect_to user_comments_path
        else
            redirect_to login_path
        end
    end

    private
    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params(*args)
        require(:comment).permit(:title, :content)
    end


end
