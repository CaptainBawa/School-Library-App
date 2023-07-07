require './tdd_activity/solver'

describe Solver do
  subject { Solver.new }

  it 'calculate factorial of a number' do
    expect(subject.factorial(4)).to eq(24)
  end

  it 'return 1 when input is 0' do
    expect(subject.factorial(0)).to eq(1)
  end

  it 'throws an error for negative numbers' do
    expect(subject.factorial(-1)).to eq 'no negative number'
  end

  it 'reverses a string' do
    expect(subject.reverse('hello')).to eq 'olleh'
  end

  it 'takes an integer and returns a string' do
    expect(subject.fizzbuzz(3)).to eq 'fizz'
  end

  it 'takes an integer and returns a string' do
    expect(subject.fizzbuzz(5)).to eq 'buzz'
  end

  it 'takes an integer and returns a string' do
    expect(subject.fizzbuzz(15)).to eq 'fizzbuzz'
  end

  it 'takes an integer and returns a string' do
    expect(subject.fizzbuzz(11)).to eq '11'
  end
end
