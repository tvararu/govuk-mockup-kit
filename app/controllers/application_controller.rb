class ApplicationController < ActionController::Base
  if Rails.env.production?
    http_basic_authenticate_with name: "This is not", password: "A real service"
  end

  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder
end
