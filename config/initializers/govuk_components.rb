module AllowButtonToAsNavigationItem
  attr_reader :destroy

  def initialize(
    text:,
    href: nil,
    options: {},
    active: nil,
    destroy: nil,
    classes: [],
    html_attributes: {}
  )
    super(text:, href:, options:, active:, classes:, html_attributes:)

    @destroy = destroy
  end

  private

  def destroy?
    destroy.present? # rubocop:disable Rails/SaveBang
  end

  def call
    tag.li(class: classes.append(active_class), **html_attributes) do
      if link?
        link_to(text, href, **options, class: "govuk-header__link")
      elsif destroy?
        button_to(
          text,
          destroy,
          method: :delete,
          **options,
          class: "app-button-link"
        )
      else
        text
      end
    end
  end
end

Rails.application.config.after_initialize do
  GovukComponent::HeaderComponent::NavigationItem.class_eval do
    prepend AllowButtonToAsNavigationItem
  end
end
