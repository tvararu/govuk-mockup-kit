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
require "rails_helper"

RSpec.describe Export do
  it "#filename" do
    export = described_class.new name: "tmp/journey-42-v1337.zip"
    assert_equal export.filename, "journey-42-v1337.zip"
  end

  it "#version" do
    export = described_class.new name: "tmp/journey-42-v1337.zip"
    assert_equal export.version, 1337
  end

  it "creating more than 5 destroys old ones" do
    journey = Journey.create! title: "New journey"
    6.times { |x| journey.exports.create! data: "123", name: x }

    assert_equal journey.exports.size, 5
    assert_equal journey.exports.first.name, "1"
  end
end
