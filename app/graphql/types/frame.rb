require 'graphql'
require_relative 'base_object'

module Types
  class Frame < BaseObject
    description 'Resembles a Frame Object Type'

    field :frame_id, GraphQL::Types::ID, null: false
    field :name, GraphQL::Types::String, null: false
    field :frame, [[[GraphQL::Types::Int]]], null: true
  end
end
