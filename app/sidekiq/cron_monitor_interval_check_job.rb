class CronMonitorIntervalCheckJob
  include Sidekiq::Job

  def perform(cron_monitor_id, end_time_string)
    CheckCronMonitorForIncident.new(cron_monitor_id, end_time_string).call
  end
end
