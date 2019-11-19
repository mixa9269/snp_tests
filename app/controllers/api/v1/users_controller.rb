# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      before_action :verify_auth_token, only: %i[current]

      def create
        outcome = Users::Create.run(user_params)
        render_single_outcome(outcome, UserSerializer)
      end

      def current
        render json: @user, serializer: UserSerializer
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
