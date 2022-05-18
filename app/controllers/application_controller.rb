class ApplicationController < ActionController::Base
  if Rails.env.production?
    http_basic_authenticate_with name: "mockup", password: "kit"
  end

  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder
end
