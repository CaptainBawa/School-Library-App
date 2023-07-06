require './rental'
require './person'
require './book'
describe Rental do
  before :all do
    @person = Student.new(20, 'John', 'y')
    @book = Book.new('Lord of the rings', 'Eli')
    @rental = Rental.new(@person, @book, '2022-08-09')
  end
  it 'rental is created' do
    expect(@rental.person).to eq(@person)
  end
  it 'contains book' do
    expect(@rental.book).to eq(@book)
  end
end
