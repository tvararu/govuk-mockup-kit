module UseDataControllerInsteadOfDataModule
  private

  def data_params
    super.transform_keys { |key| key == "module" ? "controller" : key }
  end
end

Rails.application.config.after_initialize do
  # Monkey patch all govuk-components view components to use `data-controller`
  # instead of `data-module`.
  [GovukComponent::NotificationBannerComponent].each do |component|
    component.class_eval { prepend UseDataControllerInsteadOfDataModule }
  end
end
