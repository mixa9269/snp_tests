# frozen_string_literal: true

module Exceptions
  class NotFound < StandardError; end
  class NoScopeKey < StandardError; end
  class InvalidScopeKey < StandardError; end
  class InvalidQuestionType < StandardError; end
  class UserNotFound < StandardError; end
  class UserIsNotAdmin < StandardError; end
  class Unauthenticated < StandardError; end
  class InvalidRequestData < StandardError; end
end
