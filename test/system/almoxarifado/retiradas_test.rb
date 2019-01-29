require "application_system_test_case"

class Almoxarifado::RetiradasTest < ApplicationSystemTestCase
  setup do
    @almoxarifado_retirada = almoxarifado_retiradas(:one)
  end

  test "visiting the index" do
    visit almoxarifado_retiradas_url
    assert_selector "h1", text: "Almoxarifado/Retiradas"
  end

  test "creating a Retirada" do
    visit almoxarifado_retiradas_url
    click_on "New Almoxarifado/Retirada"

    fill_in "Almoxarifado materiais", with: @almoxarifado_retirada.almoxarifado_materiais_id
    fill_in "Quantidade", with: @almoxarifado_retirada.quantidade
    click_on "Create Retirada"

    assert_text "Retirada was successfully created"
    click_on "Back"
  end

  test "updating a Retirada" do
    visit almoxarifado_retiradas_url
    click_on "Edit", match: :first

    fill_in "Almoxarifado materiais", with: @almoxarifado_retirada.almoxarifado_materiais_id
    fill_in "Quantidade", with: @almoxarifado_retirada.quantidade
    click_on "Update Retirada"

    assert_text "Retirada was successfully updated"
    click_on "Back"
  end

  test "destroying a Retirada" do
    visit almoxarifado_retiradas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retirada was successfully destroyed"
  end
end
