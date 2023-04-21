desc "Check status of minutely "
task check_minutely_cron_monitors: :environment do
  time = Time.now.to_s
  CronMonitor.where(interval: :minutely).pluck(:id).each do |c_id|
    CronMonitorIntervalCheckJob.perform_async(c_id, time)
  end
  SendSmsService.new("+16028191902", "hi from the rake task").call
end
