module QueryTypes
  TodoListQueryType = GraphQL::ObjectType.define do
    name 'TodoListQueryType'
    description 'The todo list query type'

    field :todo_lists, types[Types::TodoListType], 'returns all todo lists' do
      resolve ->(_obj, _args, _ctx) { TodoList.all }
    end

    field :items, types[Types::ItemType] do
      resolve ->(obj, _args, _ctx) { obj.items }
    end

    field :todo_list, Types::TodoListType, 'returns the queried tod list' do
      argument :id, !types.iD

      resolve ->(_obj, args, _ctx) { TodoList.find_by!(id: args[:id]) }
    end
  end
end
