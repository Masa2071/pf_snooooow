class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    @followerusers = user.followers
    @userall = User.order(current_sign_in_at: :DESC).limit(16).where.not(id: @users)
    @current_user = current_user
    @search = User.ransack(params[:q]) #ransack
    @searchusers = @search.result(distinct: true)
    @searchusers =
  if params[:q].nil?
   User.none
  else
   @search.result(distinct: true)
  end
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    @followusers = user.followings
    @current_user = current_user
    @userall = User.order(current_sign_in_at: :DESC).limit(16).where.not(id: @followusers)
    @search = User.ransack(params[:q]) #ransack
    @searchusers = @search.result(distinct: true)
    @searchusers =
  if params[:q].nil?
   User.none
  else
   @search.result(distinct: true)
  end

  end
end

