class CreateSmsIntegrations < ActiveRecord::Migration[7.0]
  def change
    create_table :sms_integrations do |t|
      t.string :phone_number
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
