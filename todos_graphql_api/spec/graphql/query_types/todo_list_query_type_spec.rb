RSpec.describe QueryTypes::TodoListQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  let!(:todo_lists) { create_list(:todo_list, 3)}

  describe 'querying all todo lists' do
    it 'has a :todo_list that returns a ToDoList type' do
      expect(subject).to have_field(:todo_lists).that_returns(types[Types::TodoListType])
    end

    it 'returns all our created todo list' do
      query_result = subject.fields['todo_list'].resolve(nil, nil, nil)

      todo_lists.each do |list|
        expect(query_result.to_a).to include(list)
      end

      expect(query_result.count).to eq(todo_lists.count)
    end
  end

  describe 'querying a specific todo_list using it\'s id ' do
    it 'returns the queried todo list' do
      id = list1.id
      args = { id: id }
      query_result = subject.fields['todo_list'].resolve(nil, args, nil)

      expect(query_result).to eq(list1)
    end
  end
end
