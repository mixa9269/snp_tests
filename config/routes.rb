# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tests/', to: 'app_tests#index'
      get '/tests/:id/', to: 'app_tests#show'
      post '/tests/', to: 'app_tests#create'
      patch '/tests/:id/', to: 'app_tests#update'
      delete '/tests/:id/', to: 'app_tests#destroy'

      post '/tests/:test_id/questions', to: 'questions#create'
      patch '/questions/:id', to: 'questions#update'
      delete '/questions/:id', to: 'questions#destroy'

      post '/questions/:question_id/answers', to: 'answers#create'
      patch '/answers/:id', to: 'answers#update'
      delete '/answers/:id', to: 'answers#destroy'

      post '/signup', to: 'users#create'
      post '/signin', to: 'sessions#create'
    end
  end
end
