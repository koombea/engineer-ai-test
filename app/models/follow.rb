class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :user_id, class_name: 'User'
  belongs_to :followee, foreign_key: :followee_id, class_name: 'User'
  
  validate :not_myself
  validates :followee_id, uniqueness: {
    scope: :user_id,
    message: 'Already following'
  }

  private
  def not_myself
    errors.add(:followee_id, "Can't follow yourself") if user_id == followee_id
  end
end
