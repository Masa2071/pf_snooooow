class UsersController < ApplicationController
  before_action :authenticate_user!

  require 'happybirthday'

  def show
    @user = User.find(params[:id])
     birthday = Happybirthday.born_on(current_user.birthday)
    @user.birthday = birthday.age.years_old
    @posts = @user.posts
    # DM処理
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true #ルーム作成
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom #ルーム作成
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
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

  def hide
    @user = User.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_delete: true)
    if @user.is_delete == true
      @user.destroy
    end
    #ログアウトさせる
    sign_out
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image, :style, :birthday, :sex, :introduction)
  end
end
