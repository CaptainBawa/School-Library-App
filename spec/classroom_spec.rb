require './classroom'
require './student'


describe Classroom do
        before :all do
            @student = Student.new('John',20,'dev', 'y')
            @classroom = Classroom.new('dev')           
        end

      it "can add student" do
        @classroom.add_student(@student)
        expect(@classroom.students.length).to eq(1) 
    end
end