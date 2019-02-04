require 'test_helper'

class Almoxarifado::RelatoriosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get almoxarifado_relatorios_index_url
    assert_response :success
  end

end
