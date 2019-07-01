require 'pry'
class Instructor
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    self.class.all << self
  end
  def self.all
    @@all
  end
  def grade_student(student,boating_test_name,status)
    found_test = BoatingTest.all.find do |test|
      (test.boating_test_name == boating_test_name) && (test.student == student)
    end
    if found_test
      found_test.boating_test_status = status
      found_test
    else
      new_boating_test = BoatingTest.new(boating_test_name,status,self)
      new_boating_test.student = student
      new_boating_test
    end
  end

  def pass_student(student,boating_test_name)
    grade_student(student,boating_test_name,"passed")
  end
  def fail_student(student,boating_test_name)
    grade_student(student,boating_test_name,"failed")
  end
end
