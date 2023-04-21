class CheckMinutelyCronMonitorsJob
  include Sidekiq::Job

  def perform
    # ugh this feels wrong.
    time = Time.now.to_s
    CronMonitor.where(interval: :minutely).pluck(:id).each do |c_id|
      CronMonitorIntervalCheckJob.perform_async(c_id, time)
    end
  end
end

Sidekiq::Cron::Job.create(name: "Hard worker - every 1min", cron: "*/1 * * * *", class: "CheckMinutelyCronMonitorsJob")
