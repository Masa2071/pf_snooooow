class Event < ApplicationRecord
  belongs_to :user
  has_many :event_comments, dependent: :destroy
  has_many :event_users, dependent: :destroy

  validates :title, presence: true, length: { maximum: 38 }
  validates :content, presence: true
  validates :etd, presence: true
  validates :eta, presence: true
  validates :preiod, presence: true

  def count_by?(event)
    (event.recruitment > event.event_users.count) && event.preiod > Time.now
  end

  def applied_by?(user)
    event_users.where(user_id: user.id).exists?
  end

end

