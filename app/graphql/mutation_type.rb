require 'graphql'
require_relative 'mutations/create_frame_mutation'
require_relative 'mutations/display_frame_mutation'
require_relative 'mutations/delete_frame_mutation'

class MutationType < GraphQL::Schema::Object
  description "The mutation root of this schema"

  field :create_frame, mutation: Mutations::CreateFrameMutation
  field :display_frame, mutation: Mutations::DisplayFrameMutation
  field :delete_frame, mutation: Mutations::DeleteFrameMutation
end
