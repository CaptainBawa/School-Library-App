require './person'
require './rental'
require './book'

describe Person do
  before :all do
    @person = Person.new(20, 'John')
    @book = Book.new('Harry Potter', 'William')
    @rental = Rental.new(@person, @book, '2022-09-08')
  end

  it 'can use services' do
    expect(@person.can_use_services).to be true
  end

  it 'can return correct name' do
    expect(@person.correct_name).to eq 'John'
  end

  it 'can be added to rental' do
    @person.add_rental(@rental)
    expect(@person.rented_books).to include(@book)
  end

  it 'can list rented books' do
    @person.add_rental(@rental)
    expect(@person.rented_books).to include(@book)
  end
end
