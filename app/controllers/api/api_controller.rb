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
  end
end
