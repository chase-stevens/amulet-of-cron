# == Schema Information
#
# Table name: email_integrations
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_email_integrations_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class EmailIntegration < ApplicationRecord
  # Broadcast changes in realtime with Hotwire
  after_create_commit -> { broadcast_prepend_later_to :email_integrations, partial: "email_integrations/index", locals: {email_integration: self} }
  after_update_commit -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :email_integrations, target: dom_id(self, :index) }

  belongs_to :account

  # send is already a method name :/ little inelegant but works for now
  def send_message(message)
    SendEmailService.new(email, message).call
  end
end
