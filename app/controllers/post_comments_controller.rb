class PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    content = PostComment.new(post_comment_params)
    content.user_id = current_user.id
    content.post_id = post.id
    content.save
    redirect_to request.referer

  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :image)
  end
end
