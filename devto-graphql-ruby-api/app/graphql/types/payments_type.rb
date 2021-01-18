module Types
  class PaymentsType < Types::BaseObject
    field :id, ID, null: false
    field :amount, Float, null: false
    field :status, String, null: false
  end
end
