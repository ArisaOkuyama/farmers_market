require "application_system_test_case"

class FarmersTest < ApplicationSystemTestCase
  setup do
    @farmer = farmers(:one)
  end

  test "visiting the index" do
    visit farmers_url
    assert_selector "h1", text: "Farmers"
  end

  test "creating a Farmer" do
    visit farmers_url
    click_on "New Farmer"

    fill_in "Address", with: @farmer.address
    fill_in "Farm name", with: @farmer.farm_name
    fill_in "First name", with: @farmer.first_name
    fill_in "Last name", with: @farmer.last_name
    fill_in "State", with: @farmer.state
    click_on "Create Farmer"

    assert_text "Farmer was successfully created"
    click_on "Back"
  end

  test "updating a Farmer" do
    visit farmers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @farmer.address
    fill_in "Farm name", with: @farmer.farm_name
    fill_in "First name", with: @farmer.first_name
    fill_in "Last name", with: @farmer.last_name
    fill_in "State", with: @farmer.state
    click_on "Update Farmer"

    assert_text "Farmer was successfully updated"
    click_on "Back"
  end

  test "destroying a Farmer" do
    visit farmers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farmer was successfully destroyed"
  end
end
