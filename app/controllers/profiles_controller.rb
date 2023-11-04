class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.profile.update(profile_params)
      redirect_to root_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :phone_number, :sns_information)
  end
end
