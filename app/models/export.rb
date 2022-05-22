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
  MAX_EXPORTS = 5

  belongs_to :journey

  after_create do
    exports = journey.exports.order(created_at: :asc)
    total = exports.count
    exports.limit(total - MAX_EXPORTS).destroy_all if total > MAX_EXPORTS
  end

  def filename
    name.gsub("tmp/", "")
  end

  # "tmp/journey-42-v1337.zip" -> 1337
  def version
    name[/-v(\d+)\./, 1].to_i
  end
end
