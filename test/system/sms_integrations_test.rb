require "application_system_test_case"

class SmsIntegrationsTest < ApplicationSystemTestCase
  setup do
    @sms_integration = sms_integrations(:one)
  end

  test "visiting the index" do
    visit sms_integrations_url
    assert_selector "h1", text: "Sms Integrations"
  end

  test "creating a Sms integration" do
    visit sms_integrations_url
    click_on "New Sms Integration"

    fill_in "Phone number", with: @sms_integration.phone_number
    click_on "Create Sms integration"

    assert_text "Sms integration was successfully created"
    assert_selector "h1", text: "Sms Integrations"
  end

  test "updating a Sms integration" do
    visit sms_integration_url(@sms_integration)
    click_on "Edit", match: :first

    fill_in "Phone number", with: @sms_integration.phone_number
    click_on "Update Sms integration"

    assert_text "Sms integration was successfully updated"
    assert_selector "h1", text: "Sms Integrations"
  end

  test "destroying a Sms integration" do
    visit edit_sms_integration_url(@sms_integration)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Sms integration was successfully destroyed"
  end
end
