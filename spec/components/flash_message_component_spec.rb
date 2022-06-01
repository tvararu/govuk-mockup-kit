require "rails_helper"

RSpec.describe FlashMessageComponent, type: :component do
  it "renders a heading and a body" do
    render_inline described_class.new(flash: { success: %w[Title Body] })

    expect(
      rendered_component
    ).to have_css ".govuk-notification-banner__heading", text: "Title"
    expect(rendered_component).to have_css ".govuk-body", text: "Body"
  end
end
