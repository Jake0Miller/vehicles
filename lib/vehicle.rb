class Vehicle
  attr_reader :year, :make, :model, :passengers, :num_adults

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
    @num_adults = 0
  end

  def speeding?
    @speeding
  end

  def speed
    @speeding = true
  end

  def add_passenger(passenger)
    @num_adults += 1 if passenger.age > 17
    @passengers << passenger
  end

  def driver
    @passengers.find { |passenger| passenger.driver? }
  end
end
