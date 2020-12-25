class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to posts_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_paramas)
    @user.save
    redirect_to posts_path
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image_id, :style, :birthday, :sex, :introduction)
  end
end