require_relative 'person'

# The `Student` class is a subclass of `Person` that adds a `classroom`
# attribute and a `play_hooky` method that returns a shrug emoji.
class Student < Person
  def initialize(name = 'Unknown', age = 0, classroom = 'Unknown', parent_permission = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  attr_accessor :classroom, :parent_permission

  def play_hooky
    '¯\(ツ)/¯'
  end
end
