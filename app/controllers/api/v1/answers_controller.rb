# frozen_string_literal: true

module Api
  module V1
    class AnswersController < ApiController
      before_action :verify_admin, only: %i[create update destroy]

      def create
        question = Question.find_by(id: params[:question_id])

        raise Exceptions::NotFound unless question

        verify_scope_key(question.app_test.scope_key)

        outcome = Answers::Create.run(answer_params(question))
        render_single_outcome(outcome, AnswerSerializer)
      end

      def update
        answer = Answer.find_by(id: params[:id])

        raise Exceptions::NotFound unless answer

        verify_scope_key(answer.question.app_test.scope_key)

        outcome = Answers::Update.run(answer_params_update(answer))
        render_single_outcome(outcome, AnswerSerializer)
      end

      def destroy
        answer = Answer.find_by(id: params[:id])

        raise Exceptions::NotFound unless answer

        verify_scope_key(answer.question.app_test.scope_key)

        answer.destroy
        render_destroy_success
      end

      private

      def answer_params(question)
        {
          question: question,
          text: params[:text],
          is_right: params[:is_right],
        }
      end

      def answer_params_update(answer)
        {
          answer: answer,
          text: params[:text],
          is_right: params[:is_right],
        }
      end
    end
  end
end
