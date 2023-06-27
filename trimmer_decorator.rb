require_relative 'decorator'

# The TrimmerDecorator class is a decorator that trims the name
# of a Nameable object to a maximum length of 10 characters.
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0...10] : @nameable.correct_name
  end
end
