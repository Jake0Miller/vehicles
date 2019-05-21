require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'
require './lib/cdot'
require './lib/intersection'
require 'pry'

class CdotTest < Minitest::Test
  def setup
    @cdot = Cdot.new
    @intersection_1 = Intersection.new("Oak St", "Pine St")
    @intersection_2 = Intersection.new("Oak St", "Tree St")
    @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle_2 = Vehicle.new("2001", "Honda", "Accord")
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Cdot, @cdot
  end

  def test_it_holds_intersections
    assert_empty @cdot.intersections

    @cdot.add_intersection(@intersection_1)
    @cdot.add_intersection(@intersection_2)

    assert_equal [@intersection_1, @intersection_2], @cdot.intersections
  end

  def test_it_knows_who_sped
    @cdot.add_intersection(@intersection_1)
    @cdot.add_intersection(@intersection_2)

    assert_empty @cdot.tickets

    @vehicle_1.add_passenger(@jude)
    @jude.drive
    @vehicle_1.speed
    @intersection_1.add_vehicle(@vehicle_1)

    @vehicle_2.add_passenger(@charlie)
    @charlie.drive
    @vehicle_2.speed
    @intersection_2.add_vehicle(@vehicle_2)

    @intersection_1.add_vehicle(@vehicle_2)

    expected = {@jude => 1, @charlie => 2}
    assert_equal expected, @cdot.tickets
  end

  def test_driver_balance
    @cdot.add_intersection(@intersection_1)
    @cdot.add_intersection(@intersection_2)

    @vehicle_1.add_passenger(@jude)
    @jude.drive
    @vehicle_1.speed
    @intersection_1.add_vehicle(@vehicle_1)

    @vehicle_2.add_passenger(@charlie)
    @charlie.drive
    @vehicle_2.speed
    @intersection_2.add_vehicle(@vehicle_2)

    @intersection_1.add_vehicle(@vehicle_2)

    assert_equal 0, @cdot.driver_balance(@taylor)
    assert_equal 100, @cdot.driver_balance(@jude)
    assert_equal 400, @cdot.driver_balance(@charlie)
  end
end
