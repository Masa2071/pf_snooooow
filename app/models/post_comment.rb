class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  attachment :image
  
  def favorited_by?(user)  
    favorites.where(user_id: user.id).exists?
  end
  
end
