class SmsIntegration < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :sms_integrations, partial: "sms_integrations/index", locals: {sms_integration: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :sms_integrations, target: dom_id(self, :index) }

  belongs_to :account

  def send_message

  end
end
