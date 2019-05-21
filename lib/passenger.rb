class Passenger
  attr_reader :name, :age

  def initialize(details)
    @name = details["name"]
    @age = details["age"]
    @driver = false
  end

  def adult?
    return @age > 17
  end

  def driver?
    @driver
  end

  def drive
    @driver = true
  end
end
