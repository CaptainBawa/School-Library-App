require './person'
require './trimmer_decorator'
describe TrimmerDecorator do
  before :all do
    @person = Person.new(20, 'Stephen Oduro')
    @trimmer = TrimmerDecorator.new(@person)
  end
  it 'can return correct name' do
    expect(@trimmer.correct_name).to eq 'Stephen Od'
  end
end
