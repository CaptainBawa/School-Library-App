require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission = nil)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Getters for id
  attr_reader :id

  # Setters for name and age and Getters for name, and age
  attr_accessor :name, :age

  # Public method can_use_services? that returns true if person is of
  # age or if they have permission from parents.
  def can_use_services
    of_age || parent_permission
  end

  # This function returns the value of the instance variable @name.
  def correct_name
    @name
  end

  # Add a rental to the person's rentals array
  def add_rental(rental)
    rentals << rental
  end

  # Get the books rented by the person
  def rented_books
    rentals.map(&:book)
  end

  private

  # Private method of_age? that returns true if @age is
  # greater or equal to 18 and false otherwise.
  def of_age
    @age >= 18
  end

  attr_accessor :rentals
end
