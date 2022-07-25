Rails.application.routes.draw do
  get 'homes/index'

  get 'homes/signup'
  get 'homes/login'
  get 'chat_box/chat'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
