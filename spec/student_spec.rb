require './student'
describe Student do
  before :all do
    @student = Student.new('Addo', 20, 'dev', true)
  end
  it 'can play hooky' do
    expect(@student.play_hooky).to eq('¯\(ツ)/¯')
  end
end
