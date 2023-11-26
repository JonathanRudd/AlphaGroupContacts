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

  def show
    @user = User.find(params[:id])
    @line = replace_at_symbol(@user.profile.sns_information)
  end

  private

  def replace_at_symbol(input_string)
    return input_string unless input_string&.start_with?('@')
    input_string.sub(/^@/, '%40')
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :phone_number, :sns_information, :affiliation, :mobile, :company_phone, :private_phone, :private_phone)
  end
end
