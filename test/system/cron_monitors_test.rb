require "application_system_test_case"

class CronMonitorsTest < ApplicationSystemTestCase
  setup do
    @cron_monitor = cron_monitors(:one)
  end

  test "visiting the index" do
    visit cron_monitors_url
    assert_selector "h1", text: "Cron Monitors"
  end

  test "creating a Cron monitor" do
    visit cron_monitors_url
    click_on "New Cron Monitor"

    fill_in "Aasm state", with: @cron_monitor.aasm_state
    fill_in "Interval", with: @cron_monitor.interval
    fill_in "Notes", with: @cron_monitor.notes
    fill_in "Title", with: @cron_monitor.title
    click_on "Create Cron monitor"

    assert_text "Cron monitor was successfully created"
    assert_selector "h1", text: "Cron Monitors"
  end

  test "updating a Cron monitor" do
    visit cron_monitor_url(@cron_monitor)
    click_on "Edit", match: :first

    fill_in "Aasm state", with: @cron_monitor.aasm_state
    fill_in "Interval", with: @cron_monitor.interval
    fill_in "Notes", with: @cron_monitor.notes
    fill_in "Title", with: @cron_monitor.title
    click_on "Update Cron monitor"

    assert_text "Cron monitor was successfully updated"
    assert_selector "h1", text: "Cron Monitors"
  end

  test "destroying a Cron monitor" do
    visit edit_cron_monitor_url(@cron_monitor)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Cron monitor was successfully destroyed"
  end
end
