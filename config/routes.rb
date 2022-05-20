Rails.application.routes.draw do
  root to: redirect("/journeys")

  resources :journeys do
    get "/export", to: "export#show"

    resources :pages
  end

  get "/preview/:journey_id", to: "preview#show", as: :preview
  get "/preview/:journey_id/pages/:id", to: "preview#page", as: :preview_page
  get "/preview/:journey_id/confirmation",
      to: "preview#confirmation",
      as: :preview_confirmation
end
