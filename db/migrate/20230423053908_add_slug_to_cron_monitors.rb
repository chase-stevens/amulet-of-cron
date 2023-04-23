class AddSlugToCronMonitors < ActiveRecord::Migration[7.0]
  def change
    add_column :cron_monitors, :slug, :string
    add_index :cron_monitors, :slug, unique: true
  end
end
