# frozen_string_literal: true

module Api
  module V1
    class QuestionsController < ApiController
      def create
        app_test = AppTest.find_by(id: params[:test_id])

        verify_scope_key(app_test.scope_key)

        raise Exceptions::NotFound unless app_test

        outcome = Questions::Create.run(question_params(app_test))
        render_single_outcome(outcome, QuestionSerializer)
      end

      def update
        question = Question.find_by(id: params[:id])

        raise Exceptions::NotFound unless question

        verify_scope_key(question.app_test.scope_key)

        outcome = Questions::Update.run(question_params_update(question))

        render_single_outcome(outcome, QuestionSerializer)
      end

      def destroy
        question = Question.find_by(id: params[:id])

        raise Exceptions::NotFound unless question

        verify_scope_key(question.app_test.scope_key)

        question.destroy
        render_destroy_success
      end

      private

      def question_params(app_test)
        {
          app_test: app_test,
          title: params[:title],
          question_type: params[:question_type],
          answer: params[:answer]
        }
      end

      def question_params_update(question)
        {
          question: question,
          title: params[:title],
          question_type: params[:question_type],
          answer: params[:answer]
        }
      end
    end
  end
end
