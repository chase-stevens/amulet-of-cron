class CreateDoodads < ActiveRecord::Migration[7.0]
  def change
    create_table :doodads do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
