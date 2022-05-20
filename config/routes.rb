Rails.application.routes.draw do
  root to: redirect("/journeys")

  resources :journeys do
    get "/export", to: "export#show"

    resources :pages
  end

  get "/preview/:journey_id", to: "preview#show", as: :preview
end
