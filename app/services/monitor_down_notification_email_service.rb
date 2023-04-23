class MonitorDownNotificationEmailService
  def initialize(cron_monitor)
    @cron_monitor = cron_monitor
    @account = @cron_monitor.account
  end

  def call
    @account.email_integrations.each do |s|
      SendEmailService.new(s.email, monitor_down_subject, monitor_down_body).call
    end
  end

  private

  def monitor_down_subject
    "Amulet of Cron -- Monitor #{@cron_monitor.title} is down."
  end

  def monitor_down_body
    "We have not heard from #{@cron_monitor.title} -- it seems to be down."
  end
end
