Rails.application.routes.draw do
  root to: redirect("/start")

  devise_for :users,
             controllers: {
               omniauth_callbacks: "users/omniauth_callbacks"
             }

  get "/start", to: "static#start"

  resources :journeys do
    resources :exports, only: %i[index show create]
    resources :pages
  end

  get "/preview/:journey_id", to: "preview#show", as: :preview
  get "/preview/:journey_id/pages/:id", to: "preview#page", as: :preview_page
  get "/preview/:journey_id/confirmation",
      to: "preview#confirmation",
      as: :preview_confirmation

  scope via: :all do
    get "/404", to: "errors#not_found"
    get "/422", to: "errors#unprocessable_entity"
    get "/500", to: "errors#internal_server_error"
  end
end
