require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'
require './lib/intersection'
require 'pry'

class IntersectionTest < Minitest::Test
  def setup
    @intersection = Intersection.new("Oak St", "Pine St")
    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle_2 = Vehicle.new("2001", "Honda", "Accord")
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Intersection, @intersection
  end

  def test_attributes
    assert_equal "Oak St", @intersection.street_1
    assert_equal "Pine St", @intersection.street_2
  end

  def test_add_vehicles
    assert_empty @intersection.vehicles

    @intersection.add_vehicle(@vehicle_1)

    assert_equal [@vehicle_1], @intersection.vehicles
  end

  def test_speeding_vehicles
    @intersection.add_vehicle(@vehicle_1)

    assert_empty @intersection.speeding_vehicles

    @vehicle_2.speed
    @intersection.add_vehicle(@vehicle_2)

    assert_equal [@vehicle_2], @intersection.speeding_vehicles
  end

  def test_speeding_drivers
    @vehicle_1.add_passenger(@jude)
    @jude.drive
    @intersection.add_vehicle(@vehicle_1)

    assert_empty @intersection.speeding_drivers

    @vehicle_2.add_passenger(@charlie)
    @vehicle_1.add_passenger(@taylor)
    @charlie.drive
    @vehicle_2.speed
    @intersection.add_vehicle(@vehicle_2)
    
    assert_equal [@charlie], @intersection.speeding_drivers
  end
end
