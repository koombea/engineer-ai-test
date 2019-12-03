class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  # Relationships
  has_many :tweets, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followees, through: :follows

  # Validations
  validates :email, uniqueness: true

  def followers
    Follow.where(followee_id: id).map(&:follower)
  end

  def following_ids
    followees.pluck(:id)
  end

  def following_tweets
    Tweet.where(user_id: following_ids)
  end
end