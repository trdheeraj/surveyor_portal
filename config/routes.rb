Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
  resources :jobs
  resources :insurances
  resources :departments
  post 'add_gross_loss', to: 'jobs#add_gross_loss', as: :add_gross_loss
  get 'new_gross_loss', to: 'jobs#new_gross_loss', as: :new_gross_loss
end
