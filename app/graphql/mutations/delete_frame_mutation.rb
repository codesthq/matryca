require 'graphql'
require_relative 'base_mutation'

module Mutations
  class DeleteFrameMutation < BaseMutation
    description 'Deletes a frame from the server'

    argument :frame_id, GraphQL::Types::ID, required: true

    field :success, GraphQL::Types::Boolean, null: false
    field :error, GraphQL::Types::String, null: true

    def resolve(frame_id:)
      return { success: true, error: nil } if FrameDeletionService.new(frame_id).call
      { success: false, error: 'Could not delete frame' }

    rescue StandardError => error
      { success: false, error: error.message }
    end
  end
end
