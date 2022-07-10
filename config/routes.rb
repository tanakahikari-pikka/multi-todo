Rails.application.routes.draw do

  root to:"category#index"
  resources :category, only: %i( new index create show edit update destroy) do
    resources :list, only: %i( create  update destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end