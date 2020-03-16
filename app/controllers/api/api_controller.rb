# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    rescue_from Exceptions::NoScopeKey do
      render json: { error: 'scope-key header is required' }, status: :bad_request
    end

    rescue_from Exceptions::InvalidScopeKey do
      render json: { error: 'scope-key header is invalid' }, status: :bad_request
    end

    rescue_from Exceptions::NotFound do
      render json: { error: 'not_found' }, status: :not_found
    end

    rescue_from Exceptions::InvalidQuestionType do
      render json: { error: 'invalid_question_type' }, status: :not_found
    end

    rescue_from Exceptions::UserNotFound do
      render json: { error: 'user_not_found' }, status: :not_found
    end

    rescue_from Exceptions::Unauthenticated do
      render json: { error: 'Authentication is required to perform this request' }, status: :unauthorized
    end

    rescue_from Exceptions::UserIsNotAdmin do
      render json: { error: 'user_is_not_admin' }, status: :bad_request
    end

    def scope_key
      request.headers['scope-key']
    end

    def check_scope_key_exists
      raise Exceptions::NoScopeKey unless scope_key
    end

    def verify_scope_key(key)
      raise Exceptions::InvalidScopeKey if key != scope_key
    end

    def render_single_outcome(outcome, serializer)
      if outcome.valid?
        render json: outcome.result, serializer: serializer
      else
        render json: outcome.errors, status: :bad_request
      end
    end

    def render_destroy_success
      render json: { status: 'ok' }, status: :ok
    end

    def render_insert_at_success
      render json: { status: 'ok' }, status: :ok
    end

    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      if @current_user
        @current_user
      elsif (token = request.headers['token'])
        @current_user = User.find_by(auth_token: token)
      elsif (user_id = session[:user_id])
        @current_user = User.find_by(id: user_id)
      end
    end

    def signed_in?
      current_user.present?
    end

    def authenticate
      signed_in? || (raise ::Exceptions::Unauthenticated)
    end

    def verify_admin
      authenticate

      raise Exceptions::UserIsNotAdmin unless current_user.is_admin
    end
  end
end
