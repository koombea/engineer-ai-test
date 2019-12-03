class UsersController < ApplicationController
  before_action :set_user

  def show
    render_ok @user
  end

  def followers
    render_ok @user.followers
  end

  def following
    render_ok @user.followees
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end