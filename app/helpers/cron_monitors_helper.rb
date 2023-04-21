module CronMonitorsHelper
  def interval_select_options
    CronMonitor.intervals.map { |k, v| [k, v] }
  end

  def status_icon(status)
    case status
    when "up"
      "✅"
    when "down"
      "❌"
    when "draft"
      "📝"
    end
  end
end
