require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require './lib/vehicle'
require 'pry'

class VehicleTest < Minitest::Test
  def setup
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Vehicle, @vehicle
  end

  def test_attributes
    assert_equal "2001", @vehicle.year
    assert_equal "Honda", @vehicle.make
    assert_equal "Civic", @vehicle.model
  end

  def test_speeding
    refute @vehicle.speeding?

    @vehicle.speed

    assert @vehicle.speeding?
  end

  def test_passengers
    assert_equal [], @vehicle.passengers

    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)

    assert_equal [@charlie, @jude, @taylor], @vehicle.passengers
    assert_equal 2, @vehicle.num_adults
  end

  def test_driver
    assert_equal [], @vehicle.passengers

    @vehicle.add_passenger(@charlie)
    @vehicle.add_passenger(@jude)
    @vehicle.add_passenger(@taylor)
    @taylor.drive

    assert_equal @taylor, @vehicle.driver
  end
end
