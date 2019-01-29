require 'test_helper'

class Almoxarifado::EntradasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @almoxarifado_entrada = almoxarifado_entradas(:one)
  end

  test "should get index" do
    get almoxarifado_entradas_url
    assert_response :success
  end

  test "should get new" do
    get new_almoxarifado_entrada_url
    assert_response :success
  end

  test "should create almoxarifado_entrada" do
    assert_difference('Almoxarifado::Entrada.count') do
      post almoxarifado_entradas_url, params: { almoxarifado_entrada: { almoxarifado_materiais_id: @almoxarifado_entrada.almoxarifado_materiais_id, numero_empenho: @almoxarifado_entrada.numero_empenho, quantidade: @almoxarifado_entrada.quantidade } }
    end

    assert_redirected_to almoxarifado_entrada_url(Almoxarifado::Entrada.last)
  end

  test "should show almoxarifado_entrada" do
    get almoxarifado_entrada_url(@almoxarifado_entrada)
    assert_response :success
  end

  test "should get edit" do
    get edit_almoxarifado_entrada_url(@almoxarifado_entrada)
    assert_response :success
  end

  test "should update almoxarifado_entrada" do
    patch almoxarifado_entrada_url(@almoxarifado_entrada), params: { almoxarifado_entrada: { almoxarifado_materiais_id: @almoxarifado_entrada.almoxarifado_materiais_id, numero_empenho: @almoxarifado_entrada.numero_empenho, quantidade: @almoxarifado_entrada.quantidade } }
    assert_redirected_to almoxarifado_entrada_url(@almoxarifado_entrada)
  end

  test "should destroy almoxarifado_entrada" do
    assert_difference('Almoxarifado::Entrada.count', -1) do
      delete almoxarifado_entrada_url(@almoxarifado_entrada)
    end

    assert_redirected_to almoxarifado_entradas_url
  end
end
