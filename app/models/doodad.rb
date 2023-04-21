# == Schema Information
#
# Table name: doodads
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint
#
# Indexes
#
#  index_doodads_on_account_id  (account_id)
#
class Doodad < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :doodads, partial: "doodads/index", locals: {doodad: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :doodads, target: dom_id(self, :index) }

  belongs_to :account
end
