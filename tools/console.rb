require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)

krabs.pass_student(spongebob,"OUR GREAT TEST")
krabs.pass_student(spongebob,"another test")
krabs.fail_student(spongebob,"THIRD TIME'S THE CHARM")
krabs.pass_student(spongebob,"FOURTH TIME'S THE CHARM")
krabs.pass_student(spongebob,"FIFTH TIME'S THE CHARM")
krabs.fail_student(patrick,"OUR GREATEST TEST")
krabs.pass_student(patrick,"another test")
p Student.find_student("Spongebob").first_name == "Spongebob"
p Student.find_student("Nick") == nil
p spongebob.grade_percentage == "67%"
p patrick.grade_percentage == "50%"

# binding.pry
0 #leave this here to ensure binding.pry isn't the last line
