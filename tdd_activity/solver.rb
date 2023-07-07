class Solver
  def factorial(number)
    return 'no negative number' if number.negative?

    counter = 1
    sum = 1
    while counter <= number
      sum *= counter
      counter += 1
    end

    sum
  end

  def reverse(string)
    string.reverse
  end
end
