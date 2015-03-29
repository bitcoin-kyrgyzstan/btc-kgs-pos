Rails.application.routes.draw do
  resources :payments, only: [:new, :create, :show]

  root to: "pages#home"
end
