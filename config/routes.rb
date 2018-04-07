Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
   devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "homes#index"
 
  resources :homes, only:[:index]
  resources :leaves,only:[:index,:new,:create]

  match 'admin/leaves/accept/:id'=>'admin/leaves#leave_status',via: :get,as: 'accept_leave'
  match 'admin/leaves/rejec/:id'=>'admin/leaves#leave_status',via: :get,as: 'reject_leave'
end
