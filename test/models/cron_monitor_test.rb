# == Schema Information
#
# Table name: cron_monitors
#
#  id         :bigint           not null, primary key
#  aasm_state :string
#  interval   :integer          default("monthly")
#  notes      :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_cron_monitors_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class CronMonitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
