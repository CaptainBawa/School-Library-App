# The Nameable class is an abstract class that requires
# its subclasses to implement the correct_name method.
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method.'
  end
end
