class CreateCheckIn < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.references :cron_monitor, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
