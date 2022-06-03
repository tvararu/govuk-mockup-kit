require "test_helper"

class FlashMessageComponentTest < ViewComponent::TestCase
  it "renders a heading and a body" do
    render_inline described_class.new(flash: { success: %w[Title Body] })

    assert_selector ".govuk-notification-banner__heading", text: "Title"
    assert_selector ".govuk-body", text: "Body"
  end
end
