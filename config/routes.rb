Rails.application.routes.draw do
  resources :users, only: [:create, :new, :destroy, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :subs, except: [:destroy] do
    resources :posts, except: [:index, :edit]
  end

  root to: "sessions#new"
end
