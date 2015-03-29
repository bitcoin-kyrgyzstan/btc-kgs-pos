Rails.application.routes.draw do

  resources :payments, only: :new

  root to: "pages#home"

end
