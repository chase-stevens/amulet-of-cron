class MonitorBackUpNotificationEmailService
  def initialize(cron_monitor)
    @cron_monitor = cron_monitor
    @account = @cron_monitor.account
  end

  def call
    @account.email_integrations.each do |s|
      SendEmailService.new(s.email, monitor_up_subject, monitor_up_body).call
    end
  end

  private

  def monitor_up_subject
    "Amulet of Cron -- Monitor #{@cron_monitor.title} is back up!"
  end

  def monitor_up_body
    "#{@cron_monitor.title} has checked in -- it's back up!"
  end
end
