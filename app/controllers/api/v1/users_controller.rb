# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :authenticate, only: %i[current]

      def create
        outcome = Users::Create.run(user_params)
        log_in(outcome.result)
        render_single_outcome(outcome, UserSerializer)
      end

      def current
        render json: current_user, serializer: UserSerializer
      end

      private

      def user_params
        {
          username: params[:username],
          is_admin: params[:is_admin],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
        }
      end
    end
  end
end
