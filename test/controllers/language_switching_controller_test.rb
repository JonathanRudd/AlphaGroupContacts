require "test_helper"

class LanguageSwitchingControllerTest < ActionDispatch::IntegrationTest
  test "should get toggle_locale" do
    get language_switching_toggle_locale_url
    assert_response :success
  end
end
