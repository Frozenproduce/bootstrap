Rails.application.routes.draw do
  devise_for :users

  resources :users do
    collection do
      post :invite
    end
    member do
      post :activate
      post :suspend
    end
    resource :auth_tokens
  end

end
