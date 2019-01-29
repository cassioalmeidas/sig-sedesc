require "application_system_test_case"

class Almoxarifado::EntradasTest < ApplicationSystemTestCase
  setup do
    @almoxarifado_entrada = almoxarifado_entradas(:one)
  end

  test "visiting the index" do
    visit almoxarifado_entradas_url
    assert_selector "h1", text: "Almoxarifado/Entradas"
  end

  test "creating a Entrada" do
    visit almoxarifado_entradas_url
    click_on "New Almoxarifado/Entrada"

    fill_in "Almoxarifado materiais", with: @almoxarifado_entrada.almoxarifado_materiais_id
    fill_in "Numero empenho", with: @almoxarifado_entrada.numero_empenho
    fill_in "Quantidade", with: @almoxarifado_entrada.quantidade
    click_on "Create Entrada"

    assert_text "Entrada was successfully created"
    click_on "Back"
  end

  test "updating a Entrada" do
    visit almoxarifado_entradas_url
    click_on "Edit", match: :first

    fill_in "Almoxarifado materiais", with: @almoxarifado_entrada.almoxarifado_materiais_id
    fill_in "Numero empenho", with: @almoxarifado_entrada.numero_empenho
    fill_in "Quantidade", with: @almoxarifado_entrada.quantidade
    click_on "Update Entrada"

    assert_text "Entrada was successfully updated"
    click_on "Back"
  end

  test "destroying a Entrada" do
    visit almoxarifado_entradas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entrada was successfully destroyed"
  end
end
