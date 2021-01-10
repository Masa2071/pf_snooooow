class RoomsController < ApplicationController
  before_action :authenticate_user!


  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)) # user.showから送られてきた@entryの中身をパラメータで許可
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    # ログイン中のユーザIDとそれに紐付くルームID
    @current_user = current_user
    if Entry.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.chats
      @message = Chat.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    # ログイン中のユーザーのIDとルームIDが一致するもの
    # @rooms = Room.joins(:entries).where( 'entries.user_id =?', current_user.id )
    @rooms = Room.all
    @user = current_user
    @currentEntries = current_user.entries
    myRoomIds = []
    @currentEntries.each do | entry |
      myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?', @user.id)

  end
end

