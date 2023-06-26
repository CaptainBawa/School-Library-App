require_relative 'person'

# The `Teacher` class is a subclass of `Person` that has a specialization
# and Override can_use_services so it always returns true.
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    !of_age
  end
end
