class User::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:create]
  respond_to :json

  def sign_up_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  def account_update_params
    params.require(:user).permit(
      :name,
      :password,
      :password_confirmation,
      :current_password
    )
  end
end