class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show update destroy]
  before_action :set_tweets, only: [:index_by_user]

  def create
    tweet = current_user.tweets.create(tweet_params)
    save_and_render tweet
  end

  def update
    @tweet.attributes = tweet_params
    save_and_render @tweet
  end

  def show
    render_ok @tweet
  end

  def destroy
    render_ok @tweet.destroy
  end

  def index
    paginate_and_render current_user.tweets
              .order("created_at #{params[:sort]}")
  end

  def index_by_user
    paginate_and_render @tweets
  end

  def following_tweets
    paginate_and_render current_user.following_tweets
              .order("created_at #{params[:sort]}")
  end

  private
  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def set_tweets
    set_user
    @tweets = @user.tweets.order("created_at #{params[:sort]}")
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def tweet_params
    params.permit(:message)
  end
end