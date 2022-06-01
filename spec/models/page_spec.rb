# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  title      :string           not null
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
require "rails_helper"

RSpec.describe Page do
end
