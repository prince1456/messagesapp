class CommentsController < ApplicationController
  def create

      @comment = Comment.new strong_params
      @post = Post.find(params[:post_id])
      @comment.post = @post
      if @comment.save
        redirect_to post_path(@post), notice: "you created a post"
      else
          flash[:notice] = "somethings wrong"
          redirect_to post_path(@post)
      end

  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to  post_path(@post)

  end
  private
  
  def strong_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
