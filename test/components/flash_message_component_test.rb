require "test_helper"

class FlashMessageComponentTest < ViewComponent::TestCase
  def test_foo
    render_inline FlashMessageComponent.new(flash: { success: %w[Title Body] })

    assert_selector ".govuk-notification-banner__heading", text: "Title"
    assert_selector ".govuk-body", text: "Body"
  end
end
