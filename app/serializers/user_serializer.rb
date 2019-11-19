# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :auth_token, :is_admin
end
