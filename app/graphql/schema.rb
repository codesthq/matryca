require 'graphql'
require_relative 'query_type'
require_relative 'mutation_type'

class MatrixAppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end
