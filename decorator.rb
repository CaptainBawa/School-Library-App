require_relative 'nameable'

# The Decorator class extends the Nameable class and
# overrides the correct_name method to return the
# correct name of the nameable object it decorates.
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
