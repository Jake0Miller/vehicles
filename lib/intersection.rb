class Intersection
  attr_reader :street_1, :street_2, :vehicles

  def initialize(street_1, street_2)
    @street_1 = street_1
    @street_2 = street_2
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def speeding_vehicles
    @vehicles.find_all { |vehicle| vehicle.speeding? }
  end

  def speeding_drivers
    speeding_vehicles.map { |vehicle| vehicle.driver }
  end
end
