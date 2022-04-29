Rails.application.routes.draw do
  devise_for :users
  resources :pets
  resources :appointments

  get 'admin/index'
  get 'admin/all_users'
  delete 'admin/delete_user'
  get 'admin/create_vet'
  post 'admin/submit_vet'
  get 'main/index'

  root 'main#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
