GovukMockupKit::Application.config.session_store :cookie_store,
secure: Rails.env.production?,
httponly: true
