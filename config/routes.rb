Rails.application.routes.draw do
  get 'homes/index'

  get 'users/login', to: "users#login"
  post "users/login",to: "users#create"
  get 'users/sign_up', to: "users#sign_up" 
  get 'chat_box/chat'
  get 'manager_jobs/manager_home_page',to: "manager_jobs#manager_home_page" , as: :manager_home
  get 'manager_jobs/add_jobs'
  get '/user_jobs/user_list_jobs',to: "user_jobs#user_list_jobs"
  get '/user_jobs/user_job_details',to: "user_jobs#user_job_details"
  get '/user_jobs/:id', to: "user_jobs#job_id"

  get "/user/logout", to: "users#logout"
  root "homes#index"

  match 'users/create', :to => 'users#create', :via => :post
  match 'user/login', :to => 'sessions#login', :via => :post
  match '/manager_add_job', :to => 'manager_jobs#manager_add_job', :via => :post
  match '/search', to: "user_jobs#search", :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
