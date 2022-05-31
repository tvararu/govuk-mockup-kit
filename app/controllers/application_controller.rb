class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "mockup",
                               password: "kit",
                               message: "THIS IS NOT A REAL GOV.UK SERVICE"

  default_form_builder GOVUKDesignSystemFormBuilder::FormBuilder
end
