require 'test_helper'

class Almoxarifado::RetiradasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @almoxarifado_retirada = almoxarifado_retiradas(:one)
  end

  test "should get index" do
    get almoxarifado_retiradas_url
    assert_response :success
  end

  test "should get new" do
    get new_almoxarifado_retirada_url
    assert_response :success
  end

  test "should create almoxarifado_retirada" do
    assert_difference('Almoxarifado::Retirada.count') do
      post almoxarifado_retiradas_url, params: { almoxarifado_retirada: { almoxarifado_materiais_id: @almoxarifado_retirada.almoxarifado_materiais_id, quantidade: @almoxarifado_retirada.quantidade } }
    end

    assert_redirected_to almoxarifado_retirada_url(Almoxarifado::Retirada.last)
  end

  test "should show almoxarifado_retirada" do
    get almoxarifado_retirada_url(@almoxarifado_retirada)
    assert_response :success
  end

  test "should get edit" do
    get edit_almoxarifado_retirada_url(@almoxarifado_retirada)
    assert_response :success
  end

  test "should update almoxarifado_retirada" do
    patch almoxarifado_retirada_url(@almoxarifado_retirada), params: { almoxarifado_retirada: { almoxarifado_materiais_id: @almoxarifado_retirada.almoxarifado_materiais_id, quantidade: @almoxarifado_retirada.quantidade } }
    assert_redirected_to almoxarifado_retirada_url(@almoxarifado_retirada)
  end

  test "should destroy almoxarifado_retirada" do
    assert_difference('Almoxarifado::Retirada.count', -1) do
      delete almoxarifado_retirada_url(@almoxarifado_retirada)
    end

    assert_redirected_to almoxarifado_retiradas_url
  end
end
