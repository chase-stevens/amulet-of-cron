class AddPathHexForCronMonitor < ActiveRecord::Migration[7.0]
  def change
    add_column :cron_monitors, :path_hex, :string, null: false
  end
end
