require "test_helper"

class CronMonitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cron_monitor = cron_monitors(:one)
  end

  test "should get index" do
    get cron_monitors_url
    assert_response :success
  end

  test "should get new" do
    get new_cron_monitor_url
    assert_response :success
  end

  test "should create cron_monitor" do
    assert_difference("CronMonitor.count") do
      post cron_monitors_url, params: {cron_monitor: {aasm_state: @cron_monitor.aasm_state, interval: @cron_monitor.interval, notes: @cron_monitor.notes, title: @cron_monitor.title}}
    end

    assert_redirected_to cron_monitor_url(CronMonitor.last)
  end

  test "should show cron_monitor" do
    get cron_monitor_url(@cron_monitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_cron_monitor_url(@cron_monitor)
    assert_response :success
  end

  test "should update cron_monitor" do
    patch cron_monitor_url(@cron_monitor), params: {cron_monitor: {aasm_state: @cron_monitor.aasm_state, interval: @cron_monitor.interval, notes: @cron_monitor.notes, title: @cron_monitor.title}}
    assert_redirected_to cron_monitor_url(@cron_monitor)
  end

  test "should destroy cron_monitor" do
    assert_difference("CronMonitor.count", -1) do
      delete cron_monitor_url(@cron_monitor)
    end

    assert_redirected_to cron_monitors_url
  end
end
