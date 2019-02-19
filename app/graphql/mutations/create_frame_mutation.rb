require 'graphql'
require_relative 'base_mutation'

module Mutations
  class CreateFrameMutation < BaseMutation
    description 'Creates a frame'

    argument :name, GraphQL::Types::String, required: true
    argument :data, [[[GraphQL::Types::Int]]], required: true

    field :success, GraphQL::Types::Boolean, null: false
    field :error, GraphQL::Types::String, null: true

    def resolve(name:, data:)
      MatrixSaveService.new(data, name).call
      { success: true, error: nil }
    rescue StandardError => error
      { success: false, error: error.message }
    end
  end
end
