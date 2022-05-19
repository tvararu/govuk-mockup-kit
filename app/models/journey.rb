# == Schema Information
#
# Table name: journeys
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Journey < ApplicationRecord
  has_many :pages

  validates :title, presence: true
end
