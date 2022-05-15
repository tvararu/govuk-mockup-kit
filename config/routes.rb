Rails.application.routes.draw do
  root to: redirect("/journeys")

  resources :journeys
end
