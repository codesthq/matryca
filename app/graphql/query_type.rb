require 'graphql'
require_relative 'types/frame'

class QueryType < GraphQL::Schema::Object
  description "The query root of matrix schema"

  field :frames, [Types::Frame], null: false do
    description 'Get all saved frames'
  end

  field :frame, Types::Frame, null: true do
    description 'Get a certain saved frame'

    argument :frame_id, GraphQL::Types::ID, required: true
  end

  def frames
    SavedFramesFetcher.new.call
  end

  def frame(frame_id:)
    FrameFetcher.new(frame_id).call
  end
end
