require './book'
require './person'
require './rental'

describe Book do
        before :all do
            @book = Book.new('Harry Potter', 'William')
            @person = Person.new(20, 'John', 'y')
            @rental = Rental.new(@person,@book,'2022-09-08')
        end

      it "creates an instance of book" do
        expect(@book.title).to eq "Harry Potter"
        expect(@book.author).to eq "William"
    end

    it "can be rented" do
        expect(@book.rented_by).to include(@person)
        expect(@person.rented_books).to include(@book)      
    end


    it "list people that rented it" do
        person=[]
        person.push(@book.rented_by)
        expect(person.length).to eq(1)
    end
end