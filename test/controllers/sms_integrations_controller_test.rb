require "test_helper"

class SmsIntegrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sms_integration = sms_integrations(:one)
  end

  test "should get index" do
    get sms_integrations_url
    assert_response :success
  end

  test "should get new" do
    get new_sms_integration_url
    assert_response :success
  end

  test "should create sms_integration" do
    assert_difference("SmsIntegration.count") do
      post sms_integrations_url, params: {sms_integration: {phone_number: @sms_integration.phone_number}}
    end

    assert_redirected_to sms_integration_url(SmsIntegration.last)
  end

  test "should show sms_integration" do
    get sms_integration_url(@sms_integration)
    assert_response :success
  end

  test "should get edit" do
    get edit_sms_integration_url(@sms_integration)
    assert_response :success
  end

  test "should update sms_integration" do
    patch sms_integration_url(@sms_integration), params: {sms_integration: {phone_number: @sms_integration.phone_number}}
    assert_redirected_to sms_integration_url(@sms_integration)
  end

  test "should destroy sms_integration" do
    assert_difference("SmsIntegration.count", -1) do
      delete sms_integration_url(@sms_integration)
    end

    assert_redirected_to sms_integrations_url
  end
end
