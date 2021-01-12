class Event < ApplicationRecord
  belongs_to :user
  has_many :event_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 38 }
  validates :content, presence: true
  validates :etd, presence: true
  validates :eta, presence: true
  validates :preiod, presence: true

end

