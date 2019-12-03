class Tweet < ApplicationRecord
  belongs_to :user

  # Validations
  validates :message, presence: true
  validates :message, length: { maximum: 140 }
end
