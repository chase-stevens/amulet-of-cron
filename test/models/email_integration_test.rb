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
require "test_helper"

class EmailIntegrationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
