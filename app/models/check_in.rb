# == Schema Information
#
# Table name: check_ins
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cron_monitor_id :uuid             not null
#
# Indexes
#
#  index_check_ins_on_cron_monitor_id  (cron_monitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (cron_monitor_id => cron_monitors.id)
#
class CheckIn < ApplicationRecord
  belongs_to :cron_monitor
end
