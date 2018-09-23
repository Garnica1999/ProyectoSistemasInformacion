require 'test_helper'

class Estudiante::MonitoriaControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get estudiante_monitoria_login_url
    assert_response :success
  end

end
