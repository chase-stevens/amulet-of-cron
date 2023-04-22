require "test_helper"

class EmailIntegrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_integration = email_integrations(:one)
  end

  test "should get index" do
    get email_integrations_url
    assert_response :success
  end

  test "should get new" do
    get new_email_integration_url
    assert_response :success
  end

  test "should create email_integration" do
    assert_difference("EmailIntegration.count") do
      post email_integrations_url, params: {email_integration: {email: @email_integration.email}}
    end

    assert_redirected_to email_integration_url(EmailIntegration.last)
  end

  test "should show email_integration" do
    get email_integration_url(@email_integration)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_integration_url(@email_integration)
    assert_response :success
  end

  test "should update email_integration" do
    patch email_integration_url(@email_integration), params: {email_integration: {email: @email_integration.email}}
    assert_redirected_to email_integration_url(@email_integration)
  end

  test "should destroy email_integration" do
    assert_difference("EmailIntegration.count", -1) do
      delete email_integration_url(@email_integration)
    end

    assert_redirected_to email_integrations_url
  end
end
