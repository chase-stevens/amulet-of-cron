# == Schema Information
#
# Table name: cron_monitors
#
#  id            :uuid             not null, primary key
#  aasm_state    :string
#  friendly_path :string           not null
#  interval      :integer          default("monthly")
#  notes         :text
#  slug          :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_cron_monitors_on_account_id  (account_id)
#  index_cron_monitors_on_slug        (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#

class CronMonitor < ApplicationRecord
  include FriendlyId
  friendly_id :friendly_path, use: :slugged
  # WARNING: IF YOU ADD A NEW VALUE, ADD IT TO THE END!
  # OR EVERY EXISTING MONITOR'S INTERVAL WILL SHIFT!!
  # rails saves enums as ints based on position in the interval array
  enum :interval, [:monthly, :weekly, :daily, :hourly, :minutely]

  after_initialize :generate_friendly_path

  after_create_commit -> { broadcast_prepend_later_to :cron_monitors, partial: "cron_monitors/index", locals: {cron_monitor: self} }
  after_update_commit -> {
    broadcast_replace_later_to self
    broadcast_replace_to(:cron_monitor_index, target: "cron_monitor_index_#{id}", partial: "cron_monitors/cron_monitor_index_card", locals: {cron_monitor: self})
    broadcast_replace_to(:cron_monitor_title, target: "cron_monitor_title_#{id}", partial: "cron_monitors/cron_monitor_title", locals: {cron_monitor: self})
  }

  after_destroy_commit -> { broadcast_remove_to :cron_monitors, target: dom_id(self, :index) }

  belongs_to :account
  has_many :check_ins

  STATE_SORT_ORDER = %w[down up draft]

  include AASM

  aasm do
    state :draft, initial: true
    state :up, :down

    event :set_up do
      transitions from: :draft, to: :up
    end

    event :alert do
      after do
        MonitorDownNotificationEmailService.new(self).call
        MonitorDownNotificationSmsService.new(self).call
      end

      transitions from: [:up, :down], to: :down
    end

    event :restore do
      after do
        MonitorBackUpNotificationEmailService.new(self).call
        MonitorBackUpNotificationSmsService.new(self).call
      end

      transitions from: :down, to: :up
    end
  end

  def interval=(value)
    value = value.to_i if value.is_a? String
    super(value)
  end

  def interval_length
    case interval
    when "minutely"
      1.minute
    when "hourly"
      1.hour
    when "daily"
      1.day
    when "weekly"
      1.week
    when "monthly"
      1.month
    end
  end

  def last_checked_in_at
    check_ins.last.created_at
  end

  def generate_friendly_path
    self.friendly_path = SecureRandom.urlsafe_base64(8)
  end
end
