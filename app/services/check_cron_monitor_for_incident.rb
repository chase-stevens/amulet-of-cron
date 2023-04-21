class CheckCronMonitorForIncident
  def initialize(cron_monitor_id, interval_finish)
    @cron_monitor = CronMonitor.find(cron_monitor_id)
    @last_check_in = @cron_monitor.check_ins&.last
    @interval_finish = interval_finish.is_a?(String) ? DateTime.parse(interval_finish) : interval_finish
    @interval_start = @interval_finish - @cron_monitor.interval_length
  end

  def call
    return if @cron_monitor.draft?

    if check_in_time.nil? || !check_in_time.between?(@interval_start, @interval_finish)
      create_incident
      cron_monitor_alert
    end
  end

  private

  def check_in_time
    @last_check_in&.created_at
  end

  def create_incident
    Incident.create(cron_monitor_id: @cron_monitor.id)
  end

  def cron_monitor_alert
    @cron_monitor.alert
    @cron_monitor.save
  end
end
