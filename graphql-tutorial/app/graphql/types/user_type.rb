module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :created_ad, DateTimeType, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :votes, [VoteType], null: false
    field :links, [LinkType], null: false
  end
end