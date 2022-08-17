# frozen_string_literal: true

Rails.application.routes.draw do
  get 'homes/index'

  get 'users/login'
  match 'users/login', to: 'users#user_login', via: :post
  get 'users/sign_up', to: 'users#sign_up'
  get 'chat_box/chat'
  get 'manager_jobs/manager_home_page', to: 'manager_jobs#manager_home_page', as: :manager_home
  get 'manager_jobs/add_jobs'
  get 'manager_jobs/applicants',to: "manager_jobs#applicants"
  get '/user_jobs/user_list_jobs', to: 'user_jobs#user_list_jobs'
  get '/user_jobs/user_job_details', to: 'user_jobs#user_job_details'
  get '/user_jobs/:id', to: 'user_jobs#job_id'
 get '/applicant_form/:id', to: 'user_jobs#applicants_form'


  get '/user/logout', to: 'users#logout'
  root 'users#sign_up'

  match 'users/create', to: 'users#create', via: :post
  # match 'user/login', to: 'sessions#login', via: :post
  match '/manager_add_job', to: 'manager_jobs#manager_add_job', via: :post
  match '/search', to: 'user_jobs#search', via: :get
  match '/applicants_details/:id', to: "user_jobs#applicants_details", via: :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
