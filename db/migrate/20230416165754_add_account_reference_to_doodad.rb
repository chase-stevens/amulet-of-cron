class AddAccountReferenceToDoodad < ActiveRecord::Migration[7.0]
  def change
    add_reference :doodads, :account
  end
end
