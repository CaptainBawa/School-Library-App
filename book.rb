class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author

  # Add a rental to the book's rentals array
  def add_rental(rental)
    rentals << rental
  end

  # Get the people who rented the book
  def rented_by
    rentals.map(&:person)
  end

  private

  attr_accessor :rentals
end
