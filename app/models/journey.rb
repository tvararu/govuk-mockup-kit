# == Schema Information
#
# Table name: journeys
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Journey < ApplicationRecord
  has_many :pages, dependent: :destroy
  has_many :exports, dependent: :destroy

  validates :title, presence: true
end
