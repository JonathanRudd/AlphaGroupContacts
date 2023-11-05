class User < ApplicationRecord
  belongs_to :department
  has_one :profile, dependent: :destroy
  before_create :build_blank_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def build_blank_profile
    # Create a new blank profile associated with the user
  build_profile
  end
end
