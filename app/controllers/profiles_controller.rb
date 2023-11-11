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

    @line = @user.profile.sns_information
    @line = replace_at_symbol(@line)
  end

  def replace_at_symbol(input_string)
    # Check if the first character is "@"
    if input_string && input_string[0] == "@"
      # Replace "@" with "%40"
      modified_string = input_string.sub(/^@/, '%40')
      return modified_string
    else
      # No change needed
      return input_string
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :phone_number, :sns_information)
  end
end
