require "application_system_test_case"

class DoodadsTest < ApplicationSystemTestCase
  setup do
    @doodad = doodads(:one)
  end

  test "visiting the index" do
    visit doodads_url
    assert_selector "h1", text: "Doodads"
  end

  test "creating a Doodad" do
    visit doodads_url
    click_on "New Doodad"

    fill_in "Title", with: @doodad.title
    fill_in "Url", with: @doodad.url
    click_on "Create Doodad"

    assert_text "Doodad was successfully created"
    assert_selector "h1", text: "Doodads"
  end

  test "updating a Doodad" do
    visit doodad_url(@doodad)
    click_on "Edit", match: :first

    fill_in "Title", with: @doodad.title
    fill_in "Url", with: @doodad.url
    click_on "Update Doodad"

    assert_text "Doodad was successfully updated"
    assert_selector "h1", text: "Doodads"
  end

  test "destroying a Doodad" do
    visit edit_doodad_url(@doodad)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Doodad was successfully destroyed"
  end
end
