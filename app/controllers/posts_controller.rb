class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
    @current_user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = @post.user
    @current_user = current_user
  end

  def destroy
    # binding.pry
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "削除しました。"
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
