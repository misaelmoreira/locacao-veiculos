require 'test_helper'

class LoginAdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get sigin" do
    get login_administrador_sigin_url
    assert_response :success
  end

end
