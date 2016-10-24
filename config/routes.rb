Rails.application.routes.draw do
  resources :users , only: [:new, :create, :index]
  root 'homes#index'
  resources :sessions, only: [:create, :new]

  post "add_friend" => "homes#add_friend"
  delete "logout" =>'sessions#destroy'
  get "inbox" => "homes#inbox"
  get "show_message" => "homes#show"
  get "outbox" => "homes#outbox"
  post "newmessage" => 'homes#new_messages'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
