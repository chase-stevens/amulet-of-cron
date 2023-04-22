class CreateEmailIntegrations < ActiveRecord::Migration[7.0]
  def change
    create_table :email_integrations do |t|
      t.string :email
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
