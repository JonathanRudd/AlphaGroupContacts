class LanguageSwitchingController < ApplicationController
  def toggle_locale
    I18n.locale = I18n.locale == :en ? :ja : :en
    redirect_back fallback_location: root_path
  end
end
