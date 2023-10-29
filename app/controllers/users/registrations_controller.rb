# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Extend the default Devise controller

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :department_id)
  end
end
