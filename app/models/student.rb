class Student
  @@all = []

  attr_accessor :first_name
  def initialize(first_name)
    @first_name = first_name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(boating_test_name,boating_test_status,instructor)
    new_boating_test = BoatingTest.new(boating_test_name,boating_test_status,instructor)
    new_boating_test.student = self
  end

  def self.find_student(first_name)
    self.all.find {|student| student.first_name == first_name}
  end

  def grade_percentage
    tests_passed = BoatingTest.all.select {|test|
      (test.student == self) && (test.boating_test_status == "passed")
      }.size.to_f
    tests_total = BoatingTest.all.select {|test|
      test.student == self
      }.size.to_f
    "#{(tests_passed / tests_total * 100).round}%"
  end
end
