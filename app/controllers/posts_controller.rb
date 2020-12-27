class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new()
    @user = @post.user
  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:content, :post_image)
  end

  def post_comment_params
    params.require(:post_comment).permit(:content, :image)
  end
end
