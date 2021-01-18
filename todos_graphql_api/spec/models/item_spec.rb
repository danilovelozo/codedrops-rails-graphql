RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    expect(build(:item)).to be_valid
  end

  let(:todo_list) { create(:todo_list) }
  let(:attributes) do
    {
      name: 'A test item',
      done: false,
      todo_list: todo_list
    }
  end

  let(:item) { create(:item, **attributes) }

  describe 'model validations' do
    it { expect(item).to allow_value(attributes[:name]).for(:name) }
    it { expect(item).to allow_value(attributes[:done]).for(:done) }
    it { expect(item).to validate_presence_of(:name) }
    it { expect(item).to validate_uniquess_of(:name) }
  end

  describe 'model associations' do
    it { expect(item).to belong_to(:todo_list) }
  end
end
