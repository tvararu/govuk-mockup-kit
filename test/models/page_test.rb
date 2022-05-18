# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  journey_id :bigint           not null
#
# Indexes
#
#  index_pages_on_journey_id  (journey_id)
#
# Foreign Keys
#
#  fk_rails_...  (journey_id => journeys.id)
#
require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
