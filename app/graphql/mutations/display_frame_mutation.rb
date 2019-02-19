require 'graphql'
require_relative 'base_mutation'

module Mutations
  class DisplayFrameMutation < BaseMutation
    description 'Displays a frame on the LED matrix'

    argument :frame_id, GraphQL::Types::ID, required: true

    field :success, GraphQL::Types::Boolean, null: false
    field :error, GraphQL::Types::String, null: true

    def resolve(frame_id:)
      frame = FrameFetcher.new(frame_id).call
      return { success: false, error: 'Frame not found!' } unless frame

      MatrixUploadService.new(frame).call

      { success: true, error: nil }
    rescue StandardError => error
      { success: false, error: error.message }
    end
  end
end
