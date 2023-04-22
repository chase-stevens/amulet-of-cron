# == Schema Information
#
# Table name: slack_integrations
#
#  id         :bigint           not null, primary key
#  channel    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_slack_integrations_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class SlackIntegration < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :slack_integrations, partial: "slack_integrations/index", locals: {slack_integration: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :slack_integrations, target: dom_id(self, :index) }

  belongs_to :account

  # send is already a method name :/ little inelegant but works for now
  def send_message(message)
    SendSlackService.new(email, message).call
  end
end
