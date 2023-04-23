class RenamePathHexToFriendlyPath < ActiveRecord::Migration[7.0]
  def change
    rename_column :cron_monitors, :path_hex, :friendly_path
  end
end
