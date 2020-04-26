Rails.application.routes.draw do

  devise_for :users

  root to: 'questions#index'
  
  resources :questions do
    resources :votes
  end
  get "delete" => 'questions#delete'
end
