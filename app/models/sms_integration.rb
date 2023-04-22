# == Schema Information
#
# Table name: sms_integrations
#
#  id           :bigint           not null, primary key
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :bigint           not null
#
# Indexes
#
#  index_sms_integrations_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class SmsIntegration < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :sms_integrations, partial: "sms_integrations/index", locals: {sms_integration: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :sms_integrations, target: dom_id(self, :index) }

  belongs_to :account

  # send is already a method name :/ little inelegant but works for now
  def send_message(message)
    SendSmsService.new(phone_number, message).call
  end
end
