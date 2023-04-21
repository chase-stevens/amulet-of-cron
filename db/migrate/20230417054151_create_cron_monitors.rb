class CreateCronMonitors < ActiveRecord::Migration[7.0]
  def change
    create_table :cron_monitors do |t|
      t.string :title
      t.string :aasm_state
      t.integer :interval, default: 0
      t.text :notes
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
