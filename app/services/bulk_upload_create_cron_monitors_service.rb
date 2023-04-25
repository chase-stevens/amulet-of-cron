class BulkUploadCreateCronMonitorsService
  def initialize(schedule_yml, account)
    @schedule_yml = parse_yaml(schedule_yml)
    @account = account
  end

  def call
    return if !@schedule_yml

    @schedule_yml.each do |k, v|
      cron_monitor = CronMonitor.new
      cron_monitor.title = k
      cron_monitor.notes = v.dig("description")
      # cron_monitor.interval = parse_cron_syntax(v.dig("cron"))
      cron_monitor.account = @account
      cron_monitor.save
    end
  end

  private

  def parse_yaml(yml)
    YAML.load(yml)
  rescue Psych::SyntaxError
    # TODO think about error reporting
    false
  end

  def parse_cron_syntax
    # TODO
  end

end
