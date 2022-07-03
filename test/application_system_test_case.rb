require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite
end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
  {
    provider: "github",
    uid: "1337",
    info: {
      email: "test@example.com",
      name: "Alice Example",
      nickname: "alicee",
      image: "image.png"
    },
    credentials: {
      token: "0xDEADBEEF"
    }
  }
)
