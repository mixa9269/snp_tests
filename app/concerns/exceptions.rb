# frozen_string_literal: true

module Exceptions
  class NotFound < StandardError; end
  class NoScopeKey < StandardError; end
  class InvalidScopeKey < StandardError; end
  class InvalidQuestionType < StandardError; end
end
