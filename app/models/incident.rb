# == Schema Information
#
# Table name: incidents
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cron_monitor_id :bigint           not null
#
# Indexes
#
#  index_incidents_on_cron_monitor_id  (cron_monitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (cron_monitor_id => cron_monitors.id)
#
class Incident < ApplicationRecord
  belongs_to :cron_monitor
end
