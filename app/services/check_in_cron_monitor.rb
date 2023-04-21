class CheckInCronMonitor
  def initialize(cron_monitor)
    @cron_monitor = cron_monitor
  end

  def call
    @check_in = CheckIn.create(cron_monitor_id: @cron_monitor.id)
    cron_monitor_update_state
    true
  end

  private

  def cron_monitor_update_state
    if @cron_monitor.draft?
      cron_monitor_set_up
    elsif @cron_monitor.down?
      cron_monitor_restore
    end
  end

  def cron_monitor_set_up
    @cron_monitor.set_up
    @cron_monitor.save
  end

  def cron_monitor_restore
    @cron_monitor.restore
    @cron_monitor.save
  end
end