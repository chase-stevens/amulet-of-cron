class CheckMonthlyCronMonitorsJob
  include Sidekiq::Job

  def perform
    # ugh this feels wrong.
    time = Time.now.to_s
    CronMonitor.where(interval: :monthly).pluck(:id).each do |c_id|
      CronMonitorIntervalCheckJob.perform_async(c_id, time)
    end
  end
end

Sidekiq::Cron::Job.create(name: "Hard worker - every 1month", cron: "0 0 1 * *", class: "CheckMonthlyCronMonitorsJob")
