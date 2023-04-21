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
require "test_helper"

class DoodadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
