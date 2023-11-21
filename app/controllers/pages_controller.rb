class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @users = User.where(department_id: current_user.department_id)
      @users =
          if params[:query].present?
            User.joins(:profile).where('LOWER(profiles.first_name) LIKE ? OR LOWER(profiles.last_name) LIKE ? OR LOWER(profiles.affiliation) LIKE ?', "%#{params[:query].downcase}%", "%#{params[:query].downcase}%", "%#{params[:query].downcase}%")
          else
            User.all
          end
    else
      @users = []
    end
  end



end
