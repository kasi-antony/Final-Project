Rails.application.routes.draw do
  get 'homes/index'

  get 'homes/signup'
  get 'homes/login'
  get 'homes/sign_up'
  get 'chat_box/chat'
  get 'manager_jobs/manager_home_page', as: :manager_home
  get 'manager_jobs/add_jobs'
  get '/user_jobs/user_list_jobs',to: "user_jobs#user_list_jobs"
  get '/user_jobs/user_job_details',to: "user_jobs#user_job_details"
  get '/user_jobs/:id', to: "user_jobs#job_id"

  root "homes#index"

  match 'homes/create', :to => 'homes#create', :via => :post
  match 'user/login', :to => 'sessions#login', :via => :post
  match '/manager_add_job', :to => 'manager_jobs#manager_add_job', :via => :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
