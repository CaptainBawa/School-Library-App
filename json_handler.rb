module JsonHandler
  # Preserve data starts here

  def load_data_from_json
    load_books_from_json
    load_people_from_json
    load_rentals_from_json
  end

  def save_data_to_json
    save_books_to_json
    save_people_to_json
    save_rentals_to_json
  end

  private

  # Loads books from JSON file
  def load_books_from_json
    if File.exist?('books.json')
      books_data = File.read('books.json')
      books_json = JSON.parse(books_data, symbolize_names: true)
      @books = books_json.map { |book_data| Book.new(book_data[:title], book_data[:author]) }
    else
      @books = []
    end
  end

  # Loads people from JSON file
  def load_people_from_json
    if File.exist?('people.json')
      people_data = File.read('people.json')
      people_json = JSON.parse(people_data, symbolize_names: true)
      @people = people_json.map do |person_data|
        if person_data[:classroom]
          Student.new(person_data[:name], person_data[:age], person_data[:classroom], person_data[:parent_permission])
        elsif person_data[:specialization]
          Teacher.new(person_data[:name], person_data[:age], person_data[:specialization])
        end
      end
    else
      @people = []
    end
  end

  # Loads rentals from JSON file
  def load_rentals_from_json
    if File.exist?('rentals.json')
      rentals_data = File.read('rentals.json')
      rentals_json = JSON.parse(rentals_data, symbolize_names: true)
      @rentals = rentals_json.map do |rental_data|
        person_name = rental_data[:person_name]
        book_title = rental_data[:book_title]
        date = rental_data[:date]
        person = @people.find { |p| p.name == person_name }
        book = @books.find { |b| b.title == book_title }
        Rental.new(person, book, date) if person && book
      end.compact
    else
      @rentals = []
    end
  end

  # Saves books to JSON file
  def save_books_to_json
    books_data = @books.map { |book| { title: book.title, author: book.author } }
    File.write('books.json', JSON.pretty_generate(books_data))
  end

  # Saves people to JSON file
  def save_people_to_json
    people_data = @people.map do |person|
      case person
      when Student
        { name: person.name, age: person.age, classroom: person.classroom, parent_permission: person.parent_permission }
      when Teacher
        { name: person.name, age: person.age, specialization: person.specialization }
      end
    end
    File.write('people.json', JSON.pretty_generate(people_data))
  end

  # Saves rentals to JSON file
  def save_rentals_to_json
    rentals_data = @rentals.map do |rental|
      {
        person_name: rental.person.name,
        book_title: rental.book.title,
        date: rental.date
      }
    end
    File.write('rentals.json', JSON.pretty_generate(rentals_data))
  end
end
