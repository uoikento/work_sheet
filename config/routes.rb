Rails.application.routes.draw do

  devise_for :users
  root 'questions#index'
  resources :questions do 
    resources :votes
  end

end
