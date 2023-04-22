class CreateSlackIntegrations < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_integrations do |t|
      t.string :channel
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
