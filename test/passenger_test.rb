require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
require 'pry'

class PassengerTest < Minitest::Test
  def setup
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  def test_it_exists
    assert_instance_of Passenger, @charlie
  end

  def test_attributes
    assert_equal "Charlie", @charlie.name
    assert_equal 18, @charlie.age
    assert @charlie.adult?
    refute @taylor.adult?
  end

  def test_driver
    refute @charlie.driver?

    @charlie.drive

    assert @charlie.driver?
  end
end
