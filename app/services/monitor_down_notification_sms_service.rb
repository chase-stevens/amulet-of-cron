class MonitorDownNotificationSmsService
  def initialize(cron_monitor)
    @cron_monitor = cron_monitor
    @account = @cron_monitor.account
  end

  def call
    @account.sms_integrations.each do |s|
      SendSmsService.new(s.phone_number, monitor_down_message).call
    end
  end

  private

  def monitor_down_message
    "Amulet of Cron -- Monitor #{@cron_monitor.title} is down."
  end
end
