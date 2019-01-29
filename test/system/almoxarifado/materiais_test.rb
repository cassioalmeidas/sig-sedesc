require "application_system_test_case"

class Almoxarifado::MateriaisTest < ApplicationSystemTestCase
  setup do
    @almoxarifado_material = almoxarifado_materiais(:one)
  end

  test "visiting the index" do
    visit almoxarifado_materiais_url
    assert_selector "h1", text: "Almoxarifado/Materiais"
  end

  test "creating a Material" do
    visit almoxarifado_materiais_url
    click_on "New Almoxarifado/Material"

    fill_in "Descricao", with: @almoxarifado_material.descricao
    click_on "Create Material"

    assert_text "Material was successfully created"
    click_on "Back"
  end

  test "updating a Material" do
    visit almoxarifado_materiais_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @almoxarifado_material.descricao
    click_on "Update Material"

    assert_text "Material was successfully updated"
    click_on "Back"
  end

  test "destroying a Material" do
    visit almoxarifado_materiais_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Material was successfully destroyed"
  end
end
