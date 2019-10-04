Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get ':user_name', to: 'profile#show', as: :profile
  get ':user_name/edit', to: 'profile#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profile#update', as: :update_profile
  
  root 'posts#index'

  resources :posts do 
    resources :comments
  end
end
