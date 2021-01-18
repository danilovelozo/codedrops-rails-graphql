module Types
  class RentalType < Types::BaseObject
    name 'Rental'
    field :id, !types.ID
    field :rental_type, !types.String
    field :accomodates, !types.Int
    field :posta_code, types.String
    field :owner, Tupes::UserType do
      resolve -> (obj, args, ctx) { obj.user }
    end
    field :bookings, !types[Types::BookingType]
  end
end
