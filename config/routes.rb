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
    end
  end
end
