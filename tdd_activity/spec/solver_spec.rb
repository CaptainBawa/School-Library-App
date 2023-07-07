require './tdd_activity/solver'

describe Solver do
    subject {Solver.new}

    it "calculate factorial of a number" do
        expect(subject.factorial(4)).to eq(24)
    end

    it "throws an error for negative numbers" do
        expect(subject.factorial(-1)).to eq "no negative number"
    end 
end