require 'json'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'json_handler'

class App
  include JsonHandler
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # The function `list_all_books` prints the title and author of each
  # book in the `@books` array.
  def list_all_books
    puts 'All Books:'
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author} \n \n"
    end
  end

  # The function `list_all_people` prints the ID, name, and age of each
  # person in the `@people` array.
  # The function `list_all_people` prints the ID, name, age, and additional attributes
  # of each person in the `@people` array.
  def list_all_people
    puts 'All People:'
    @people.each do |person|
      case person
      when Student
        puts "[Student] - ID: #{person.id}, Name: #{person.name}, Age: #{person.age},\
        Classroom: #{person.classroom},Parent Permission: #{person.parent_permission} \n \n"
      when Teacher
        puts "[Teacher] - ID: #{person.id}, Name: #{person.name}, Age: #{person.age},\
        Specialization: #{person.specialization} \n \n"
      else
        puts "[Unknow] - ID: #{person.id}, Name: #{person.name}, Age: #{person.age} \n \n"
      end
    end
  end

  # The function `create_person` prompts the user to enter the type, name,
  # and age of a person, and
  # then creates a student or teacher object based on the entered type.
  # Returns:
  #   The method is returning nothing (nil).
  def create_person
    puts 'Enter person type (student/teacher):'
    person_type = gets.chomp.downcase

    puts 'Enter name:'
    name = gets.chomp

    puts 'Enter age:'
    age = gets.chomp.to_i

    case person_type
    when 'student'
      create_student(name, age)
    when 'teacher'
      create_teacher(name, age)
    else
      puts 'Invalid person type!'
      return
    end

    puts "Person created successfully.\n \n"
  end

  # The function creates a new student object with the given name, age,
  # and classroom, and adds it to
  # a list of people.
  # Args:
  #   name: The name of the student. It is a string.
  #   age: The age parameter is used to specify the age of the student
  # being created.
  def create_student(name, age)
    puts 'Enter classroom:'
    classroom = gets.chomp
    puts 'Enter parents permission [Y/N]:'
    parent_permission = convert_permissions(gets.chomp)
    person = Student.new(name, age, classroom, parent_permission)
    @people << person
  end

  # This function takes inputs for permission
  # and returns it as true if input is 'y' and false if input is 'n'
  def convert_permissions(input)
    (input == 'y')
  end

  # The function creates a new instance of a Teacher class with the given
  # name, age, and
  # specialization, and adds it to an array called @people.
  # Args:
  #   name: The name of the teacher. It is a string.
  #   age: The age parameter is used to specify the age of the teacher being created.
  def create_teacher(name, age)
    puts 'Enter specialization:'
    specialization = gets.chomp
    person = Teacher.new(name, age, specialization)
    @people << person
  end

  # The function `create_book` prompts the user to enter a title and author,
  # creates a new `Book`
  # object with the provided information, and adds it to a collection of books.
  def create_book
    puts 'Enter book title:'
    title = gets.chomp

    puts 'Enter author name:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts "Book created successfully. \n \n"
  end

  # The function `create_rental` prompts the user to enter a person ID,
  # book title, and rental date,
  # and then creates a new rental object with the provided information.
  # Returns:
  #   The method is returning nothing (nil).
  def create_rental
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.id == person_id }
    unless person
      puts "Person with ID #{person_id} not found!\n \n"
      return
    end

    puts 'Enter book title:'
    book_title = gets.chomp

    book = @books.find { |b| b.title == book_title }
    unless book
      puts "Book with title '#{book_title}' not found!\n \n"
      return
    end

    puts 'Enter rental date [YY-MM-DD]:'
    date = gets.chomp

    rental = Rental.new(person, book, date)
    @rentals << rental

    puts "Rental created successfully.\n \n"
  end

  # The `run` function displays a menu, prompts the user for an option,
  # processes the chosen option,
  # and continues until the user chooses option 7.
  def run
    loop do
      display_menu
      option = gets.chomp.to_i
      process_option(option)
      break if option == 7
    end
  end

  # The function `display_menu` displays a menu for a school library app with
  # various options.
  def display_menu
    puts "Welcome to School Library App\n \n"
    puts 'Choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
  end

  # The function `process_option` takes an option as input and performs a
  # specific action based on the
  # value of the option.
  # Args:
  #   option: The parameter "option" is the user's input, which represents the
  # option they have chosen
  # from a menu. It is used in a case statement to determine which action to
  # perform based on the chosen option.
  def process_option(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person
    else
      puts "Thanks for using my app! I hope you enjoyed it... or at least didnt hate it.
      \n \n"
    end
  end

  # The function `list_rentals_for_person` takes a person ID as input, finds
  # the person with that ID, and lists all rentals associated with that person.
  # Returns:
  #   The method is returning a list of rentals for a person with a given ID.
  def list_rentals_for_person
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    unless person
      puts "Person with ID #{person_id} not found!\n \n"
      return
    end
    puts "Rentals for Person ID #{person_id}:"
    rentals = @rentals.select { |rental| rental.person == person }
    rentals.each do |rental|
      puts "Book: #{rental.book.title}, Date: #{rental.date}\n \n"
    end
  end
end
