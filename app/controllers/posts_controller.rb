class PostsController < ApplicationController
      before_action :authenticate_user!
      before_action :find_params, only:[:show, :update, :edit, :destroy]

    def index
      @posts = Post.all.order(created_at: :DESC).page(params[:page]).per(10)
    end

    def edit
    end

    def create
      @post = Post.new(strong_params)
      @user = current_user
      @post.user = @user
      if @post.save
        redirect_to root_path, notice: "you created a post  successfully"
      else
        flash[:notice] = "Somethings wrong"
        render :new
      end
    end

    def update

      if @post.update(strong_params)
          redirect_to post_path(@post), notice: "post successfully updated"
      else
        flash[:notice] = "somethings wrong with your informations"
          render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    def new
      @post = Post.new
    end

    def show
      @comment = Comment.new
      @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(3)
    end

    private

    def strong_params
      params.require(:post).permit(:title, :body, :user_id, :image)
    end

    def find_params
      @post = Post.find(params[:id])
    end
end
