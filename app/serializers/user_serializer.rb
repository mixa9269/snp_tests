# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :auth_token, :is_admin
end
