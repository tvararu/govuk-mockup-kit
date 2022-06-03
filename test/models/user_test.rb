# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image                  :string           not null
#  name                   :string           not null
#  nickname               :string           not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  it "self.from_omniauth" do
    auth =
      OpenStruct.new(
        provider: "Provider",
        uid: "123",
        info:
          OpenStruct.new(
            email: "alice@example.com",
            name: "Alice Example",
            nickname: "alicee",
            image: "image.png"
          )
      )

    alice = described_class.from_omniauth(auth)

    assert_equal alice.name, "Alice Example"
  end
end
