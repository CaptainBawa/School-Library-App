require_relative 'person'

# The `Student` class is a subclass of `Person` that adds a `classroom`
# attribute and a `play_hooky` method that returns a shrug emoji.
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
