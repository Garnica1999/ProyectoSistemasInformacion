require 'test_helper'

class Estudiante::HorarioControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get estudiante_horario_login_url
    assert_response :success
  end

end
