# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def create
        outcome = Users::Create.run(user_params)
        render_single_outcome(outcome, UserSerializer)
      end

      private

      def user_params
        {
          nickname: params[:nickname],
          is_admin: params[:is_admin],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
        }
      end
    end
  end
end
