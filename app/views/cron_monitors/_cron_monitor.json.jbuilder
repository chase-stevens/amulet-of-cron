json.extract! cron_monitor, :id, :title, :aasm_state, :interval, :notes, :created_at, :updated_at
json.url cron_monitor_url(cron_monitor, format: :json)
