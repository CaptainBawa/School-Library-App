class Person
    def initialize(name = "Unknown", parent_permission = true, age)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    # Getters for id, name, and age
    attr_reader :id, :name, :age
  
    # Setters for name and age
    attr_writer :name, :age
  
    # Public method can_use_services? that returns true if person is of 
    # age or if they have permission from parents. 
    def can_use_services
      of_age || parent_permission
    end
  
    private
  
    # Private method of_age? that returns true if @age is 
    # greater or equal to 18 and false otherwise.
    def of_age
      @age >= 18
    end
  
    def parent_permission?
      @parent_permission
    end
  end