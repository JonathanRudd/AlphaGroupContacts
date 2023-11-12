class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if user_signed_in?
      @users = User.where(department_id: current_user.department_id)
    else
      @users = []
    end
  end

end
