# == Schema Information
#
# Table name: exports
#
#  id         :bigint           not null, primary key
#  data       :binary           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  journey_id :bigint           not null
#
# Indexes
#
#  index_exports_on_journey_id  (journey_id)
#
# Foreign Keys
#
#  fk_rails_...  (journey_id => journeys.id)
#
class Export < ApplicationRecord
  belongs_to :journey

  def filename
    name.gsub("tmp/", "")
  end
end
