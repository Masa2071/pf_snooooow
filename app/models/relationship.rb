class Relationship < ApplicationRecord

  belongs_to :follower, class_name: "User" #followerモデルは存在しないためUserモデルをbelongs_toする
  belongs_to :followed, class_name: "User"

  validates :followed_id, presence: true
  validates :follower_id, presence: true

end
