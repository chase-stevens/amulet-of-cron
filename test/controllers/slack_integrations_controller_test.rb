require "test_helper"

class SlackIntegrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @slack_integration = slack_integrations(:one)
  end

  test "should get index" do
    get slack_integrations_url
    assert_response :success
  end

  test "should get new" do
    get new_slack_integration_url
    assert_response :success
  end

  test "should create slack_integration" do
    assert_difference("SlackIntegration.count") do
      post slack_integrations_url, params: {slack_integration: {channel: @slack_integration.channel}}
    end

    assert_redirected_to slack_integration_url(SlackIntegration.last)
  end

  test "should show slack_integration" do
    get slack_integration_url(@slack_integration)
    assert_response :success
  end

  test "should get edit" do
    get edit_slack_integration_url(@slack_integration)
    assert_response :success
  end

  test "should update slack_integration" do
    patch slack_integration_url(@slack_integration), params: {slack_integration: {channel: @slack_integration.channel}}
    assert_redirected_to slack_integration_url(@slack_integration)
  end

  test "should destroy slack_integration" do
    assert_difference("SlackIntegration.count", -1) do
      delete slack_integration_url(@slack_integration)
    end

    assert_redirected_to slack_integrations_url
  end
end
