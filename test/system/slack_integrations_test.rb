require "application_system_test_case"

class SlackIntegrationsTest < ApplicationSystemTestCase
  setup do
    @slack_integration = slack_integrations(:one)
  end

  test "visiting the index" do
    visit slack_integrations_url
    assert_selector "h1", text: "Slack Integrations"
  end

  test "creating a Slack integration" do
    visit slack_integrations_url
    click_on "New Slack Integration"

    fill_in "Channel", with: @slack_integration.channel
    click_on "Create Slack integration"

    assert_text "Slack integration was successfully created"
    assert_selector "h1", text: "Slack Integrations"
  end

  test "updating a Slack integration" do
    visit slack_integration_url(@slack_integration)
    click_on "Edit", match: :first

    fill_in "Channel", with: @slack_integration.channel
    click_on "Update Slack integration"

    assert_text "Slack integration was successfully updated"
    assert_selector "h1", text: "Slack Integrations"
  end

  test "destroying a Slack integration" do
    visit edit_slack_integration_url(@slack_integration)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Slack integration was successfully destroyed"
  end
end
