class CreateIncident < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.references :cron_monitor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
