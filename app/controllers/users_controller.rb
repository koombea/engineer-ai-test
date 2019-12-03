class UsersController < ApplicationController
  before_action :set_user

  def show
    render_ok @user
  end

  def followers
    paginate_and_render @user.followers
  end

  def following
    paginate_and_render @user.followees
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end