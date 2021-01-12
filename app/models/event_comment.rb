class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :content, presence: true, length: { maximum: 120 }

end
