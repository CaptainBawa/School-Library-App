class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
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

  private

  # Private method of_age? that returns true if @age is
  # greater or equal to 18 and false otherwise.
  def of_age
    @age >= 18
  end

  def parent_permission?
    @parent_permission
  end
end
