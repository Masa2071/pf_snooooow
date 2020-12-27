class UsersController < ApplicationController

  require 'happybirthday'

  def show
    @user = User.find(params[:id])
     birthday = Happybirthday.born_on(current_user.birthday)
    @user.birthday = birthday.age.years_old
    @posts = @user.posts
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
     params.require(:user).permit(:name, :profile_image, :style, :birthday, :sex, :introduction)
  end
end
