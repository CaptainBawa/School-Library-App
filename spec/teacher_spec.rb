require './teacher'
describe Teacher do
  before :all do
    @teacher = Teacher.new('Addo', 20, 'dev')
  end
  it 'can use services' do
    expect(@teacher.can_use_services).to be true
  end
end
