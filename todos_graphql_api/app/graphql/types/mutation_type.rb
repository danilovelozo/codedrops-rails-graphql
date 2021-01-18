module Types
  class MutationType < Types::BaseObject
    root_type.fields = Util::FieldCombiner.combine([
      Mutations::TodoListMutation
      Mutations::ItemMutation
    ])
  end
end
