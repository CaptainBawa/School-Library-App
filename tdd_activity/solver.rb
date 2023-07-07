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

  def fizzbuzz(number)
    return 'fizzbuzz' if (number % 3).zero? && (number % 5).zero?
    return 'fizz' if (number % 3).zero?
    return 'buzz' if (number % 5).zero?

    number.to_s
  end
end
