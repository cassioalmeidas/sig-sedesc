require 'test_helper'

class Almoxarifado::MateriaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @almoxarifado_material = almoxarifado_materiais(:one)
  end

  test "should get index" do
    get almoxarifado_materiais_url
    assert_response :success
  end

  test "should get new" do
    get new_almoxarifado_material_url
    assert_response :success
  end

  test "should create almoxarifado_material" do
    assert_difference('Almoxarifado::Material.count') do
      post almoxarifado_materiais_url, params: { almoxarifado_material: { descricao: @almoxarifado_material.descricao } }
    end

    assert_redirected_to almoxarifado_material_url(Almoxarifado::Material.last)
  end

  test "should show almoxarifado_material" do
    get almoxarifado_material_url(@almoxarifado_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_almoxarifado_material_url(@almoxarifado_material)
    assert_response :success
  end

  test "should update almoxarifado_material" do
    patch almoxarifado_material_url(@almoxarifado_material), params: { almoxarifado_material: { descricao: @almoxarifado_material.descricao } }
    assert_redirected_to almoxarifado_material_url(@almoxarifado_material)
  end

  test "should destroy almoxarifado_material" do
    assert_difference('Almoxarifado::Material.count', -1) do
      delete almoxarifado_material_url(@almoxarifado_material)
    end

    assert_redirected_to almoxarifado_materiais_url
  end
end
