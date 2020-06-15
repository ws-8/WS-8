Rails.application.routes.draw do
  get 'post_answer/new'

  get 'post_question/new'

  get 'question_detail/index'

  get 'question/index'

  root 'top#index'
  get 'usertop/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :articles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
