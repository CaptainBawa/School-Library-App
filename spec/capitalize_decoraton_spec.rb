require './person'
require './capitalize_decorator'

describe CapitalizeDecorator do
    before :all do
        @person= Person.new(20,'stephen')
        @trimmer= CapitalizeDecorator.new(@person)
    end

    it "can return correct name" do
        expect(@trimmer.correct_name).to eq 'Stephen'
    end

end