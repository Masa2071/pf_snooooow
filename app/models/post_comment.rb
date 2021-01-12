class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  attachment :image
  
  validates :content, presence: true, length: { maximum: 120 }
  
  def favorited_by?(user)  
    favorites.where(user_id: user.id).exists?
  end
  
end
