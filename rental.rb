# The `Rental` class represents a rental transaction between a
# person and a book, with a specific date.
class Rental
  def initialize(person, book, date = 'Unknown')
    @date = date
    @person = person
    @book = book
    person.add_rental(self)
    book.add_rental(self)
  end

  attr_accessor :date, :person, :book
end
