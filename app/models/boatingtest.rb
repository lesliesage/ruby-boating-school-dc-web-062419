class BoatingTest
  @@all = []
  attr_accessor :student, :boating_test_name, :boating_test_status, :instructor
  def initialize(boating_test_name,boating_test_status,instructor)
    @student = student
    @boating_test_name = boating_test_name
    @boating_test_status = boating_test_status
    @instructor = instructor
    self.class.all << self
  end

  def self.all
    @@all
  end

end
