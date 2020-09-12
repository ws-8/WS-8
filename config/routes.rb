# frozen_string_literal: true

Rails.application.routes.draw do
  resources :course_files
  get 'scream/index'

  get 'comment/new'

  get 'answer/index'

  root 'top#index'

  get 'post_answer/new'
  get 'post_question/new'

  get '/question_detail/:question_id', to: 'question_detail#index', as: :question_detail
  get 'question/index'

  get '/question_list/:id', to: 'question#list', as: :question_list
  get '/question_detail', to: 'question_detail#index'
  get '/question/post_question/:id/new', to: 'question#new'
  post '/question/post_question/:id', to: 'question#create'

  get '/scream/index/:id', to: 'scream#index', as: :scream
  post '/scream/button/:id', to: 'scream#button', as: :scream_button
  get '/scream/question/:id/:p', to: 'scream#question', as: :scream_question

  post '/question_detail/authorized/:id', to: 'question_detail#authorized', as: :answer_authorized
  post '/question_detail/unauthorized/:id', to: 'question_detail#unauthorized', as: :answer_unauthorized
  post '/question_detail/solved/:id', to: 'question_detail#solved', as: :question_solved
  post '/question_detail/unsolved/:id', to: 'question_detail#unsolved', as: :question_unsolved
  post '/question_detail/metoo/:id/:user_id', to: 'question_detail#metoo', as: :metoo
  post '/question_detail/ans_score/:id/:user_id', to: 'question_detail#ans_score', as: :ans_score
  post '/question_detail/com_score/:id/:user_id', to: 'question_detail#com_score', as: :com_score

  get '/post_answer/:id', to: 'post_answer#new', as: :post_answer
  post '/post_answer/:id', to: 'post_answer#create', as: :create_answer

  get '/comment/:id', to: 'comment#new', as: :new_comment
  post '/comment/:id', to: 'comment#create', as: :comment_create

  get  '/signup', to: 'users#new'

  get  '/ws8_system', to: 'top#index'
  get  '/top_page', to: 'usertop#index'

  get 'usertop/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/course_files/:id/new', to: 'course_files#new'

  resources :articles
  resources :users
  # resources :course_files

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
