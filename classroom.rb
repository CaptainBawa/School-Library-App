# The `Classroom` class represents a classroom and allows for
# the addition of students.
class Classroom
  def initialize(label)
    super()
    @label = label
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    students << student
    student.classroom = self
  end
end
