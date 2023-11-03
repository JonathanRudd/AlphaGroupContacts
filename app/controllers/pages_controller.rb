class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

#    @department = Department.find(current_user.department_id)

    @users = User.where(department_id: current_user.department_id)

  end
end
