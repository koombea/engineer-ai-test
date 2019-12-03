class Api::V1::FollowsController < Api::V1::ApiController
  before_action :set_follow, only: [:destroy]

  def create
    follow = current_user.follows.create(
      followee_id: params[:user_id]
    )
    save_and_render follow
  end

  def destroy
    render_ok @follow.destroy
  end

  private
  def set_follow
    @follow = current_user.follows.find_by(
      followee_id: params[:user_id]
    )
  end
end 