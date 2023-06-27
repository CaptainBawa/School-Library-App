require_relative 'decorator'

# The CapitalizeDecorator class is a decorator that
# capitalizes the name of a nameable object.
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
