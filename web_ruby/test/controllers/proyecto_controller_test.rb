require 'test_helper'

class ProyectoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proyecto_index_url
    assert_response :success
  end

end
