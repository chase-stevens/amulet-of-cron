require "application_system_test_case"

class EmailIntegrationsTest < ApplicationSystemTestCase
  setup do
    @email_integration = email_integrations(:one)
  end

  test "visiting the index" do
    visit email_integrations_url
    assert_selector "h1", text: "Email Integrations"
  end

  test "creating a Email integration" do
    visit email_integrations_url
    click_on "New Email Integration"

    fill_in "Email", with: @email_integration.email
    click_on "Create Email integration"

    assert_text "Email integration was successfully created"
    assert_selector "h1", text: "Email Integrations"
  end

  test "updating a Email integration" do
    visit email_integration_url(@email_integration)
    click_on "Edit", match: :first

    fill_in "Email", with: @email_integration.email
    click_on "Update Email integration"

    assert_text "Email integration was successfully updated"
    assert_selector "h1", text: "Email Integrations"
  end

  test "destroying a Email integration" do
    visit edit_email_integration_url(@email_integration)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Email integration was successfully destroyed"
  end
end
